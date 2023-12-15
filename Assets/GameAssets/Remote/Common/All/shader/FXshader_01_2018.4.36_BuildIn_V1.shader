Shader "CustomShader/FX/FXshader_01_2018.4.36_BuildIn_V1" {
	Properties{
		_MainTex("MainTex", 2D) = "white" {}
		//Diffuse第一层贴图
		[KeywordEnum(OFF, ON)] _isReverseMask("Mask图取反",float) = 0
		[Enum(TwoSide,0,Off,2)] _TwoSide("2-Side",float) = 2
		[KeywordEnum(OFF, ON)] _FogMode("FogMode", float) = 0

        // 是否根据UI rect进行裁剪
        [Toggle]_RectClip("在Rect中裁剪", Float) = 0
		[HideInInspector] _ZWrite("__zw", Float) = 1.0
		[HideInInspector] _UseCustomData("UseCustomData", Float) = 0
		_AlphaCutout("_AlphaCutout",Range(0,1)) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest("ZTest", Float) = 4
        _Area("Area", Vector) = (0,0,1,1)

		//是否顶点运动
		[Foldout] _VertexWaveShown("", Float) = 1
		[Toggle]_VertexWave("顶点扰动",Float) = 0
		_WaveMagnitude("扰动强度", Float) = 1
		_WaveFrequency("扰动频率", Float) = 1
		_WaveLength("扰动波长", Float) = 10

	    _Diffuse("第一层贴图", 2D) = "white" {}
		[Toggle]_SplitDiffuse("纹理通道分离",Float) = 0
		//是否可旋转
		[Toggle]_DiffuseRo("旋转",Float) = 0
		_DiffuseAng("旋转角度", Range(0 , 360)) = 0
		[HDR]_Color("颜色", Color) = (1,1,1,1)
		_Brightness("亮度(0-10)", Range(0,10)) = 1
		_Uspeed("Uspeed", float) = 0
		_Vspeed("Vspeed", float) = 0
		//DiffuseMask第一层贴图遮罩
		[Foldout] _DiffuseMaskShown("", Float) = 1
		[Toggle]_DiffuseMask("第一层遮罩",Float) = 0
		_DiffuseMaskTex("遮罩贴图", 2D) = "white" {}
		[Toggle]_isDistortDiffuseMask("接受扭曲",Float) = 0
		//是否可旋转
		[Toggle]_SplitMask("遮罩通道分离",Float) = 0
		[Toggle]_DiffuseMaskRo("旋转",Float) = 0
		_DiffuseMaskAng("旋转角度", Range(0 , 360)) = 0
		_USpeed_diffusem("USpeed", float) = 0
		_VSpeed_diffusem("VSpeed", float) = 0
		//第二层贴图
		[KeywordEnum(BLEND, ADD, MULTI)]_SLayerBlendMode("混合方式",Float) = 0 //
		[Foldout] _SecondLayerShown("", Float) = 1
		[Toggle]_SecondLayerBlock("第二层",Float) = 0
		[Toggle]_SplitSecondLayer("通道分离",Float) = 0
		[Toggle]_isDistortSecondLayer("接受扭曲",Float) = 0
		_SecondLayerTex("第二层贴图", 2D) = "white" {}
		_SecondLayerColor("颜色", Color) = (1,1,1,1)
		_SecondLayerBrightness("亮度(0-10)", Range(0,10)) = 1
		//是否可旋转
		[Toggle]_SecondLayerRo("旋转",Float) = 0
		_SecondLayerAng("旋转角度", Range(0 , 360)) = 0
		_Uspeed_second("Uspeed", float) = 0
		_Vspeed_second("Vspeed", float) = 0
		//第二层贴图遮罩
		[Foldout] _SecondLayerMaskShown("", Float) = 1
		[Toggle]_SecondLayerMask("第二层遮罩",Float) = 0
		[Toggle]_isDistortSLayerMask("接受扭曲",Float) = 0
		_SecondLayerMaskTex("遮罩贴图", 2D) = "white" {}
		//是否可旋转
		[Toggle]_SecondLayerMaskRo("旋转",Float) = 0
		_SecondLayerMaskAng("旋转角度", Range(0 , 360)) = 0
		_Uspeed_secondm("USpeed", float) = 0
		_Vspeed_secondm("VSpeed", float) = 0
		//溶解贴图
		[Foldout] _DissolveShown("", Float) = 1
		[Toggle]_DissolveBlock("溶解",Float) = 0
		//是否由顶点颜色透明度控制溶解
		[Toggle]_DissolveVertex("顶点颜色控制溶解",Float) = 0
		_DissolveTex("溶解贴图", 2D) = "white" {}
		_Uspeed_dissolve("溶解Uspeed", float) = 0
		_Vspeed_dissolve("溶解Vspeed", float) = 0
		_DissolveColor("溶解勾边颜色", Color) = (1,1,1,1)
		_Dissolve("溶解度", float) = 0
		_DissolveSize("溶解勾边大小", Range(0.0, 1.0)) = 0.15
		_DissolveBrightness("溶解勾边亮度(0-10)", Range(0,10)) = 1

		[Toggle]_DissolveFade("淡入淡出",Float) = 0
		_DissolveTexMultiple("淡出",Float) = 0.0
		_DissolveFadeIntensity("淡出强度",Range(0.0,1.0)) = 0.0
		//溶解贴图遮罩
		[Foldout] _DissolveMaskShown("", Float) = 1
		[Toggle]_DissolveMask("溶解遮罩",Float) = 0
		_DissolveMaskTex("遮罩贴图", 2D) = "white" {}
		//扭曲贴图
		[Foldout] _DistortShown("", Float) = 1
		[Toggle]_DistortBlock("扭曲",Float) = 0
		_DistortTex("扭曲贴图",2D) = "white" {}
		[Toggle]_FlowMap("流动",Float) = 0
		_HeatTime("扭曲运动加速值", float) = 0
			//_DistortColor("Distort Color", Color) = (1,1,1,1)
		_ForceX("强度 X(0 1)", Range(0 , 1)) = 0.1
		_ForceY("强度 Y(0 1)", Range(0 , 1)) = 0.1
		_USpeed_distort("USpeed", float) = 0
		_VSpeed_distort("VSpeed", float) = 0
		//扭曲贴图遮罩
		[Foldout] _DistortMaskShown("", Float) = 1
		[Toggle]_DistortMask("扭曲遮罩",Float) = 0
		_DistortMaskTex("遮罩贴图", 2D) = "white" {}

		[HideInInspector]_BlendSet("__mode", Float) = 1
		[HideInInspector]_SrcRGBMode("__src_rgb",Float) = 5
		[HideInInspector]_SrcAlphaMode("__src_alpha",Float) = 5
		[HideInInspector]_DestRGBMode("__dst_rgb",Float) = 10
		[HideInInspector]_DestAlphaMode("__dst_alpha",Float) = 10

		[HideInInspector][Toggle] _ShowStencil("Use Stencil", Float) = 0
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp("Stencil Comparison", Float) = 8
		[HideInInspector]_Stencil("Stencil ID", Float) = 0
		[HideInInspector]_StencilOp("Stencil Operation", Float) = 0
		[HideInInspector]_StencilWriteMask("Stencil Write Mask", Float) = 255
		[HideInInspector]_StencilReadMask("Stencil Read Mask", Float) = 255

		//菲尼尔效应
		[HideInInspector][Toggle] _ShowFresnel("Use Fresnel", Float) = 0
		_Fresnel("Fresnel", Float) = 0

		[HideInInspector]_ColorMask("Color Mask", Float) = 15

		//加个RectSize的开关定义
		[HideInInspector][Toggle] _ShowRectSize("Use RectSize", Float) = 0
		_RectSize("RectSize", Vector) = (0,0,0,0)
	}
		SubShader{
			Tags {
				"IgnoreProjector" = "True"
				"Queue" = "Transparent"
				"RenderType" = "Transparent"
				"ArtType" = "Effect"
				"DisableBatching" = "False"
			}
			LOD 220
			Pass {
				Lighting Off
				Blend[_SrcRGBMode][_DestRGBMode],[_SrcAlphaMode][_DestAlphaMode]
				Cull[_TwoSide]
				ZWrite[_ZWrite]
				ZTest[_ZTest]
				ColorMask RGB
				Stencil
				{
					Ref[_Stencil]
					Comp[_StencilComp]
					Pass[_StencilOp]
					ReadMask[_StencilReadMask]
					WriteMask[_StencilWriteMask]
				}
				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#pragma shader_feature _FOGMODE_ON _FOGMODE_OFF
				#pragma shader_feature FOG_LINEAR
				#pragma shader_feature _ALPHATEST_ON
				#pragma fragmentoption ARB_precision_hint_fastest

				#ifdef _FOGMODE_OFF
				#undef FOG_LINEAR
				#endif
				#pragma multi_compile __ GLOBAL_MASK_ON
				#pragma  shader_feature  _CUSTOMDATA_ON
				#pragma  shader_feature  _VERTEXWAVE_ON
				#pragma  shader_feature  _SPLITDIFFUSE_ON
				#pragma  shader_feature  _SPLITMASK_ON
				#pragma  shader_feature  _DIFFUSERO_ON
				#pragma  shader_feature  _DIFFUSEMASK_ON
				#pragma  shader_feature  _DIFFUSEMASKRO_ON
				#pragma  shader_feature  _SECONDLAYERBLOCK_ON
				#pragma  shader_feature  _SPLITSECONDLAYER_ON
				#pragma  shader_feature  _SECONDLAYERRO_ON
				#pragma  shader_feature  _SECONDLAYERMASK_ON
				#pragma  shader_feature  _SECONDLAYERMASKRO_ON
				#pragma  shader_feature  _DISSOLVEBLOCK_ON
				#pragma  shader_feature  _DISSOLVE_FADE_ON

				#pragma  shader_feature  _DISSOLVEMASK_ON
				#pragma  shader_feature  _DISTORTBLOCK_ON 
				#pragma  shader_feature  _DISTORTMASK_ON 
				#pragma  shader_feature  _FLOWMAP_ON 

				#pragma  shader_feature  _SHOWFRESNEL_ON

				#include "UnityCG.cginc"
				#define FORCE_PIXEL_FOG

				float4 _RectSize;
				fixed _ShowRectSize;

				fixed _RectClip;
				float _HeatTime;
				float _isReverseMask;

				sampler2D _Diffuse;
				float4 _Diffuse_ST;
				float4 _Color;
				float _DiffuseAng;
				float _Brightness;
				float _Uspeed;
				float _Vspeed;

				#if _ALPHATEST_ON
				float _AlphaCutout;
				#endif
				#if _VERTEXWAVE_ON
				float _WaveMagnitude;
				float _WaveFrequency;
				float _WaveLength;
				#endif
				#if _DIFFUSEMASK_ON
				sampler2D _DiffuseMaskTex;
				float4 _DiffuseMaskTex_ST;
				float _DiffuseMaskAng;
				float _USpeed_diffusem;
				float _VSpeed_diffusem;
				float _isDistortDiffuseMask;
				#endif


				#if _DISSOLVEBLOCK_ON
				sampler2D _DissolveTex;
				float _Uspeed_dissolve;
				float _Vspeed_dissolve;
				float4 _DissolveTex_ST;
				float4 _DissolveColor;
				float _Dissolve;
				float _DissolveSize;
				float _DissolveBrightness;
				#endif

				#if _DISSOLVE_FADE_ON
				float _DissolveTexMultiple;
				float _DissolveFadeIntensity;
				#endif

				#if _DISSOLVEMASK_ON
				sampler2D _DissolveMaskTex;
				#endif

				#if _SECONDLAYERBLOCK_ON

				sampler2D _SecondLayerTex;
				float4 _SecondLayerTex_ST;
				float4 _SecondLayerColor;
				float _SecondLayerAng;
				float _SecondLayerBrightness;
				float _Uspeed_second;
				float _Vspeed_second;
				float _SLayerBlendMode;
				float _isDistortSecondLayer;
				#endif

				#if _SECONDLAYERMASK_ON
				float _isDistortSLayerMask;
				sampler2D _SecondLayerMaskTex;
				float4 _SecondLayerMaskTex_ST;
				float _SecondLayerMaskAng;
				float _Uspeed_secondm;
				float _Vspeed_secondm;
				#endif

				#if _DISTORTBLOCK_ON 
				sampler2D _DistortTex;
				float4 _DistortTex_ST;
				float _ForceX;
				float _ForceY;
				float _USpeed_distort;
				float _VSpeed_distort;
				#endif

				#if _DISTORTMASK_ON
				sampler2D _DistortMaskTex;
				#endif

				#if _SHOWFRESNEL_ON
				float _Fresnel;
				#endif

                float4 _Area;

				#if GLOBAL_MASK_ON
				sampler2D _GlobalMask;
				float4 _GlobalMaskRect;
				#endif

				struct VertexInput {
					float4 vertex : POSITION;
					float4 texcoord0 : TEXCOORD0;
					float4 vertexColor : COLOR;
					#if _CUSTOMDATA_ON
					float4 customData1 : TEXCOORD1;
					float4 customData2 : TEXCOORD2;
					#endif
					#if _SHOWFRESNEL_ON
					float3 normal : NORMAL;
					#endif
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};
				struct VertexOutput {
					float4 vertex : SV_POSITION;
					#if _DIFFUSEMASK_ON
					float4 uv0 : TEXCOORD0;
					#else
					float2 uv0 : TEXCOORD0;
					#endif
					#if _SECONDLAYERBLOCK_ON || _SECONDLAYERMASK_ON
					float4 uv1 :TEXCOORD1;
					#endif
					#if _DISSOLVEBLOCK_ON ||  _DISTORTBLOCK_ON
					float4 uv2 :TEXCOORD2;
					#endif

					float4 vertexColor : COLOR;

                    // 记一下顶点的世界坐标
                    float3 worldPos :TEXCOORD3;

					UNITY_FOG_COORDS(4)
					UNITY_VERTEX_OUTPUT_STEREO
					#if _CUSTOMDATA_ON
					float4 customData1 : TEXCOORD5;
					float4 customData2 : TEXCOORD6;
					#endif
					#if _SHOWFRESNEL_ON
					float3 normalDir : TEXCOORD7;
					#endif
				};

				float GetSplitTextureValue(sampler2D tex, float2 splitUV)
				{
					float2 realUV = frac(splitUV);
					if (realUV.x < 0.5)
					{
						if (realUV.y < 0.5)
							return tex2D(tex, realUV * 2).r;

						else
							return tex2D(tex, float2(realUV.x, realUV.y - 0.5) * 2).b;
					}
					else
					{
						if (realUV.y < 0.5)
							return tex2D(tex, float2(realUV.x - 0.5, realUV.y) * 2).g;

						else
							return tex2D(tex, float2(realUV.x - 0.5, realUV.y - 0.5) * 2).a;
					}

				}

				float ReverseValue(float maskV)
				{
					if (_isReverseMask > 0)
						return 1 - maskV;
					else
						return maskV;
				}
				VertexOutput vert(VertexInput v) {
					VertexOutput o = (VertexOutput)0;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
					float jxTime = _Time.x;
					float4 offset = float4(0.0,0.0, 0.0, 0.0);
					#if _VERTEXWAVE_ON
					offset.x = sin(_WaveFrequency * jxTime + v.vertex.x * _WaveLength + v.vertex.y * _WaveLength + v.vertex.z * _WaveLength) * _WaveMagnitude;
					offset.y = sin(_WaveFrequency * jxTime + v.vertex.x * _WaveLength + v.vertex.y * _WaveLength + v.vertex.z * _WaveLength) * _WaveMagnitude;
					v.vertex += offset;
					#endif
					float2 clipSpace;
					o.vertex = UnityObjectToClipPos(v.vertex);
					o.vertexColor = v.vertexColor;

					float2 offsetByCustom = float2(0, 0);
					#if _CUSTOMDATA_ON
					offsetByCustom = v.customData1.xy;
					#endif

					//uv计算
					#if _DIFFUSERO_ON
					float DiffuseAng_cos;
					float DiffuseAng_sin;

					sincos(_DiffuseAng * 0.0174, DiffuseAng_sin, DiffuseAng_cos);
					float2 panner0 = mul(v.texcoord0.xy - float2(0.5,0.5),float2x2(DiffuseAng_cos, -DiffuseAng_sin, DiffuseAng_sin, DiffuseAng_cos)) + float2(0.5,0.5) + jxTime * float2(_Uspeed, _Vspeed) + offsetByCustom;
					#else
					float2 panner0 = v.texcoord0.xy + jxTime * float2(_Uspeed, _Vspeed) + offsetByCustom;
					#endif
					o.uv0.xy = TRANSFORM_TEX(panner0, _Diffuse);

					#if _DIFFUSEMASK_ON
					#if _DIFFUSEMASKRO_ON
					float DiffuseMaskAng_cos;
					float DiffuseMaskAng_sin;
					sincos(0.0174 * _DiffuseMaskAng, DiffuseMaskAng_sin, DiffuseMaskAng_cos);
					//uv旋转前将旋转中心移到uv中心
					float2 panner1 = mul(v.texcoord0.xy - float2(0.5,0.5),float2x2(DiffuseMaskAng_cos, -DiffuseMaskAng_sin, DiffuseMaskAng_sin, DiffuseMaskAng_cos)) + float2(0.5,0.5) + jxTime * float2(_USpeed_diffusem, _VSpeed_diffusem);
					#else
					float2 panner1 = v.texcoord0.xy + jxTime * float2(_USpeed_diffusem, _VSpeed_diffusem);
					#endif
					o.uv0.zw = TRANSFORM_TEX(panner1, _DiffuseMaskTex);
					#endif

					#if _SECONDLAYERBLOCK_ON 
					#if _SECONDLAYERRO_ON
					float FlowAng_cos;
					float FlowAng_sin;
					sincos(_SecondLayerAng * 0.0174, FlowAng_sin, FlowAng_cos);
					float2 panner2 = mul(v.texcoord0.xy - float2(0.5,0.5),float2x2(FlowAng_cos, -FlowAng_sin, FlowAng_sin, FlowAng_cos)) + float2(0.5,0.5) + jxTime * float2(_Uspeed_second, _Vspeed_second);
					#else
					float2 panner2 = v.texcoord0.xy + jxTime * float2(_Uspeed_second, _Vspeed_second);
					#endif
					o.uv1.xy = TRANSFORM_TEX(panner2, _SecondLayerTex);
					#endif

					#if _SECONDLAYERBLOCK_ON && _SECONDLAYERMASK_ON
					#if _SECONDLAYERMASKRO_ON
					float FlowMaskAng_cos;
					float FlowMaskAng_sin;
					sincos(_SecondLayerMaskAng * 0.0174, FlowMaskAng_sin, FlowMaskAng_cos);
					float2 panner3 = mul(v.texcoord0.xy - float2(0.5,0.5),float2x2(FlowMaskAng_cos, -FlowMaskAng_sin, FlowMaskAng_sin, FlowMaskAng_cos)) + float2(0.5,0.5) + jxTime * float2(_Uspeed_secondm, _Vspeed_secondm);
					#else
					float2 panner3 = v.texcoord0.xy + jxTime * float2(_Uspeed_secondm, _Vspeed_secondm);
					#endif
					o.uv1.zw = TRANSFORM_TEX(panner3, _SecondLayerMaskTex);
					#endif

					#if _DISSOLVEBLOCK_ON
					o.uv2.xy = TRANSFORM_TEX(v.texcoord0.xy, _DissolveTex);
					o.uv2.xy += float2(_Uspeed_dissolve, _Vspeed_dissolve) * jxTime;
					#endif

					#if _DISTORTBLOCK_ON

					o.uv2.zw = TRANSFORM_TEX(v.texcoord0.xy, _DistortTex);
					#endif

					#if _CUSTOMDATA_ON
					o.customData1 = v.customData1;
					o.customData2 = v.customData2;
					#endif

					UNITY_TRANSFER_FOG(o,o.vertex);
                    o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;

					#if _SHOWFRESNEL_ON
					o.normalDir = UnityObjectToWorldNormal(v.normal);
					#endif

					return o;
				}
				float4 frag(VertexOutput i) : COLOR {

					float jxTime = _Time.x;
					#if _DIFFUSEMASK_ON
					float2 uvDiffuseMask = i.uv0.zw;
					#endif
					#if _SECONDLAYERBLOCK_ON
					float2 uvSecondLayer = i.uv1.xy;
					#endif
					#if _SECONDLAYERMASK_ON
					float2 uvSecondLayerMask = i.uv1.zw;
					#endif


					#if _DISTORTBLOCK_ON 

					#if _FLOWMAP_ON 
					half3 flowDir = tex2D(_DistortTex, i.uv2.zw) * 2.0f - 1.0f;
					#if _DISTORTMASK_ON
					float4 _DistortMaskTex_var = tex2D(_DistortMaskTex, i.uv2.zw);
					float tmpMask1 = ReverseValue(_DistortMaskTex_var.r);
					#endif
					//return half4(finalColor.rgb*_Brightness, finalColor.a);
					#else

					#if _CUSTOMDATA_ON
					_USpeed_distort += i.customData2.z;
					_VSpeed_distort += i.customData2.w;
					#endif


					fixed4 offsetColor1 = tex2D(_DistortTex, i.uv2.zw + fmod(float2(_USpeed_distort, _VSpeed_distort) * jxTime, 1) + fmod(_Time.xz * _HeatTime,1));
					fixed4 offsetColor2 = tex2D(_DistortTex, i.uv2.zw + fmod(float2(_USpeed_distort, _VSpeed_distort) * jxTime, 1) + fmod(_Time.yx * _HeatTime,1));

					float2 oldUV = i.uv0.xy;
					#if _CUSTOMDATA_ON
					_ForceX += i.customData2.y;
					_ForceY += i.customData2.y;
					#endif
					

					float offsetX = ((offsetColor1.r + offsetColor2.r) - 1) * _ForceX;
					float offsetY = ((offsetColor1.r + offsetColor2.r) - 1) * _ForceY;
					i.uv0.x += offsetX;
					i.uv0.y += offsetY;

					#if _DIFFUSEMASK_ON
					if (_isDistortDiffuseMask > 0.5)
					{
						uvDiffuseMask.x += offsetX;
						uvDiffuseMask.y += offsetY;
					}
					#endif // _DIFFUSEMASK_ON 

					#if _SECONDLAYERBLOCK_ON
					if (_isDistortSecondLayer > 0.5)
					{
						uvSecondLayer.x += offsetX;
						uvSecondLayer.y += offsetY;
					}
					#endif //_SECONDLAYERBLOCK_ON

					#if _SECONDLAYERMASK_ON
					if (_isDistortSLayerMask > 0.5)
					{
						uvSecondLayerMask.x += offsetX;
						uvSecondLayerMask.y += offsetY;
					}
					#endif//_SECONDLAYERBLOCK_ON

					float2 newUV = i.uv0.xy;

					//fixed4 resColor = i.color * _TintColor * tex2D(_MainTex, resUV)* _Brightness;
					//float4 _Distort_var = tex2D(_DistortTex,i.uv2.zw);

					#if _DISTORTMASK_ON
					float4 _DistortMaskTex_var = tex2D(_DistortMaskTex,i.uv2.zw);
					float tmpMask1 = ReverseValue(_DistortMaskTex_var.r);
					float2 resUV = lerp(oldUV, newUV, tmpMask1);
					i.uv0.xy = resUV;
					//i.uv0+=float2(_Distort_var.r*_ForceX*_DistortMaskTex_var.a,_Distort_var.r*_ForceY*tmpMask1);
					#else
					float2 resUV = newUV;//lerp(oldUV, newUV, tmpMask1.xy);
					i.uv0.xy = resUV;
					//i.uv0+=float2(_Distort_var.r*_ForceX*_Distort_var.a,_Distort_var.r*_ForceY*_Distort_var.a);
					#endif //_DISTORTMASK_ON
					#endif //_FLOWMAP_ON
					#endif //_DISTORTBLOCK_ON

					float2 realDiffuseUV = i.uv0.xy;
					//颜色计算
					#if _DISTORTBLOCK_ON && _FLOWMAP_ON 	
					//half3 mask_var = tex2D(_Mask, TRANSFORM_TEX(IN.texcoord, _Mask));
					flowDir *= _HeatTime;//_FlowSpeed;
					half phase0 = frac(_Time.y * 0.5f + 0.5f);
					half phase1 = frac(_Time.y * 0.5f);
					half2 offset0 = flowDir.xy * phase0;
					half2 offset1 = flowDir.xy * phase1;
					#if	_DISTORTMASK_ON 
					offset0 *= tmpMask1;
					offset1 *= tmpMask1;
					#endif//_DISTORTMASK_ON
					half flowLerp = abs((0.5f - phase0) * 2.0f);

					#if _SPLITDIFFUSE_ON
					float4 tex0 = float4(1, 1, 1, GetSplitTextureValue(_Diffuse, realDiffuseUV + offset0));
					float4 tex1 = float4(1, 1, 1, GetSplitTextureValue(_Diffuse, realDiffuseUV + offset1));
					#else
					float4 tex0 = tex2D(_Diffuse, realDiffuseUV + offset0);
					float4 tex1 = tex2D(_Diffuse, realDiffuseUV + offset1);
					#endif

					//i.uv0.xy += flowDir.xy * phase0;
					//half4 tex0 = tex2D(_MainTex, IN.texcoord + flowDir.xy * IN.phase0*mask_var.r);
					//half4 tex1 = tex2D(_MainTex, IN.texcoord + flowDir.xy * IN.phase1*mask_var.r);
					float4 _Diffuse_var = lerp(tex0, tex1, flowLerp);
					//float4 _Diffuse_var = tex2D(_Diffuse, i.uv0.xy);				
					#else
					#if _SPLITDIFFUSE_ON
					float4 _Diffuse_var = float4(1, 1, 1, GetSplitTextureValue(_Diffuse, realDiffuseUV));
					#else
					float4 _Diffuse_var = tex2D(_Diffuse, realDiffuseUV);
					#endif
					#endif

					float4 col = i.vertexColor * _Diffuse_var * _Color * _Brightness;

					#if _CUSTOMDATA_ON
					col *= 1 + i.customData1.z;
					#endif

					#if _DIFFUSEMASK_ON
					#if _SPLITMASK_ON
					float realMaskResult = GetSplitTextureValue(_DiffuseMaskTex, uvDiffuseMask);
					#else
					float realMaskResult = tex2D(_DiffuseMaskTex, uvDiffuseMask).r;
					#endif
					float tmpMask2 = ReverseValue(realMaskResult);
					col = float4((col.rgb),(col.a * tmpMask2));
					#endif

					#if _ALPHATEST_ON
					clip(col.a - _AlphaCutout);
					#endif
					#if _SECONDLAYERBLOCK_ON
					

					#if _SPLITSECONDLAYER_ON
					float sAlpha = GetSplitTextureValue(_SecondLayerTex, uvSecondLayer) * _SecondLayerColor.a;
					float4 col2 = _SecondLayerColor * _SecondLayerBrightness * i.vertexColor;
					#else
					float4 _SecondLayerTex_var = tex2D(_SecondLayerTex, uvSecondLayer);//i.uv2
					float sAlpha = _SecondLayerTex_var.a * _SecondLayerColor.a;
					float4 col2 = _SecondLayerTex_var * _SecondLayerColor * _SecondLayerBrightness * i.vertexColor;
					#endif

					float tmpBlendModel = _SLayerBlendMode;

					#if _SECONDLAYERMASK_ON
					float4 _SecondLayerMaskTex_var = tex2D(_SecondLayerMaskTex, uvSecondLayerMask);//i.uv3
					float tmpMask3 = ReverseValue(_SecondLayerMaskTex_var.r);

					//颜色融合
					if (tmpBlendModel < 0.5)
						col = col2 * sAlpha * tmpMask3 + col * (1 - sAlpha * tmpMask3);
					else if (tmpBlendModel < 1.5)
						col = lerp(col, col + col2, sAlpha * tmpMask3);
					else
						col = col * (col2 * tmpMask3);

					#else
					if (tmpBlendModel < 0.5)
						col = col2 * sAlpha + col * (1 - sAlpha);
					else if (tmpBlendModel < 1.5)
						col = lerp(col,col + col2, sAlpha);
					else
						col *= col2;

					#endif
					#endif


					//溶解模块
					#if _DISSOLVEBLOCK_ON

					float4 _Dissolve_var = tex2D(_DissolveTex,i.uv2.xy);

					#if _DISSOLVE_FADE_ON

					#if _CUSTOMDATA_ON
					_DissolveTexMultiple += i.customData1.w;
					#endif

					float oriA = col.a;
					float fadeCol = clamp(_Dissolve_var.r * _DissolveTexMultiple,0,1);
					col.a = lerp(col.a,0,fadeCol);
					if (col.a > 1.0 - _DissolveFadeIntensity)
					{
					   col.a = oriA;
					}

					#else 

					float dissolve;

					//uv控制
					#if _CUSTOMDATA_ON
					_Dissolve += i.customData1.w;
					_DissolveBrightness += i.customData2.x;
					#endif

					//顶点色控制
					#if _DISSOLVEVERTEX_ON
					dissolve = _Dissolve_var.r + i.vertexColor.a - 1;
					#else
					dissolve = _Dissolve_var.r - _Dissolve;
					#endif

					//溶解遮罩
					#if _DISSOLVEMASK_ON
					float4 _DissolveMaskTex_var = tex2D(_DissolveMaskTex,i.uv2.xy);
					float tmpMask4 = ReverseValue(_DissolveMaskTex_var.r);
					dissolve = _Dissolve_var - _Dissolve + (1 - tmpMask4);
					if (dissolve < _DissolveSize)
					col = col * _DissolveColor * _DissolveBrightness;
					#endif

					col.rgb = lerp(col.rgb,col.rgb * _DissolveColor.rgb * _DissolveBrightness,sign(_DissolveSize - dissolve) * 0.5 + 0.5);
					col.a = lerp(col.a,col.a * _DissolveColor.a,clamp((_DissolveSize - dissolve) * 10,0,1));
					clip(dissolve);
					#endif		
					#endif

					UNITY_APPLY_FOG(i.fogCoord,col);

					#if _SHOWFRESNEL_ON
					/*float isFrontFace = (facing >= 0 ? 1 : 0);
					float faceSign = (facing >= 0 ? 1 : -1);
					i.normalDir = normalize(i.normalDir);
					i.normalDir *= faceSign;*/
					float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.worldPos.xyz);
					float3 normalDirection = i.normalDir;
					col.rgb = (col.rgb * pow(1.0 - max(0, dot(normalDirection, viewDirection)), _Fresnel));
					#endif

					bool inArea = (_RectClip == 0) || (i.worldPos.x >= _Area.x && i.worldPos.x <= _Area.z && i.worldPos.y >= _Area.y && i.worldPos.y <= _Area.w);
					col.a *= inArea;


					#if GLOBAL_MASK_ON
					float maskU = clamp((i.worldPos.x - _GlobalMaskRect.x) / _GlobalMaskRect.z, 0.01, 0.99);
					float maskV = clamp((i.worldPos.y - _GlobalMaskRect.y) / _GlobalMaskRect.w, 0.01, 0.99);
					col.a *= tex2D(_GlobalMask, float2(maskU, maskV)).x;
					#endif
					
					half4 color = col;
					bool inRect = (_ShowRectSize == 0) || (i.vertex.x >= _RectSize.x && i.vertex.x <= _RectSize.z && i.vertex.y >= _RectSize.y && i.vertex.y <= _RectSize.w);
					color.a *= inRect;

                    return color;
				}
				ENDCG
			}
		}
	CustomEditor "CustomUI"
}
