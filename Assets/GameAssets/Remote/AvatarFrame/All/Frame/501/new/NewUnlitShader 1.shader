Shader "Custom/UIGameObject" {
Properties {
    _MainTex ("Texture1 (RGB)", 2D) = "white" {}
    _Color ("Main Color", Color) = (1,1,1,1)

    _StencilComp ("Stencil Comparison", Float) = 8
    _Stencil ("Stencil ID", Float) = 0
    _StencilOp ("Stencil Operation", Float) = 0
    _StencilWriteMask ("Stencil Write Mask", Float) = 255
    _StencilReadMask ("Stencil Read Mask", Float) = 255

    _ColorMask ("Color Mask", Float) = 15

    [Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
}

Category {
    Tags {"RenderType"="Opaque" "Queue"="Transparent"}
    Lighting Off
    BindChannels {
        Bind "Color", color
        Bind "Vertex", vertex
        Bind "Texcoord", Texcoord
    }

    //screen 1 - (1 - a) * (1 - b)

    SubShader {
        Stencil
        {
            Ref [_Stencil]
            Comp [_StencilComp]
            Pass [_StencilOp]
            ReadMask [_StencilReadMask]
            WriteMask [_StencilWriteMask]
        }
        ColorMask [_ColorMask]

        

        Pass {
            ZWrite Off
            ZTest Off
            Cull Off
            Blend One OneMinusSrcAlpha
            BlendOp Add
            /*SetTexture [_MainTex] {
                constantColor [_Color]
                Combine texture * constant
            }*/
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #pragma target 2.0

            #include "UnityCG.cginc"
            #include "UnityUI.cginc"

            #pragma multi_compile __ UNITY_UI_CLIP_RECT
            #pragma multi_compile __ UNITY_UI_ALPHACLIP

            // 在这里定义顶点着色器的输入结构体
            struct appdata {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            // 在这里定义顶点着色器的输出结构体
            struct v2f {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
                // #### required for RectMask2D ####
                float4 worldPosition    : TEXCOORD1;
            };

            sampler2D _MainTex;
            fixed4 _Color;

            // 顶点着色器
            v2f vert(appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                // #### required for RectMask2D ####
                o.worldPosition = v.vertex;
                return o;
            }

            // 片段着色器
            fixed4 frag(v2f i) : SV_Target {
                fixed4 col = tex2D(_MainTex, i.uv) * _Color;
                fixed4 color = col;
                #ifdef UNITY_UI_CLIP_RECT
                color.a *= UnityGet2DClipping(i.worldPosition.xy, _ClipRect);
                #endif

                #ifdef UNITY_UI_ALPHACLIP
                clip (color.a - 0.001);
                #endif
                return color;
            }
            ENDCG
        }
        
    }
}
}