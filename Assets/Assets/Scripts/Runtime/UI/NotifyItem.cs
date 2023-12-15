using DG.Tweening;
using Forevernine.Garfield.Proto;
using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;


public enum NotifyType
{
    // 赞
    Zan,
    // MilleFeuille
    MilleFeuille,
    // 枕头
    Pillow,
    // 香水
    Perfume,
    // 香蕉派
    Pie,
    // 魔法棒
    MagicWand,
    // UFO
    UFO,
}
public class NotifyItemData
{
    public string openid; //角色id
    public long curtime; //当前时间
    public NotifyType notifyType; //通知类型
    public string avatarurl; //头像url
    public string nickname; //昵称
    public string tip; //提示
    public int times; //次数
}

public class NotifyItem : MonoBehaviour
{
    //头像
    public Image m_HeadImage;
    //昵称
    public Text m_NickName;
    //tip
    public TextMeshProUGUI m_Tip;
    //tip
    public TextMeshProUGUI m_Times;


    bool m_inited = false;
    NotifyItemData m_data;
    private Coroutine scaleCoroutine;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (m_inited == false)
        {
            m_inited = true;

            m_NickName.text = m_data.nickname;
            m_Tip.text = m_data.tip;
            m_Times.text = "x"+m_data.times;

            StartCoroutine(LoadAvatar(m_data.avatarurl));
        }
    }

    public void ShowInfo(NotifyItemData data)
    {
        m_data = data;
    }

    public void RefreshTimes()
    {
        if (m_inited)
        {
            if (m_Times.text != "x" + m_data.times)
            {
                if (scaleCoroutine != null)
                {
                    StopCoroutine(scaleCoroutine);
                }
                scaleCoroutine = StartCoroutine(ScaleTimes());
            }
            m_Times.text = "x" + m_data.times;
        }
    }

    private IEnumerator ScaleTimes()
    {
        // 放大动画
        m_Times.transform.DOScale(Vector3.one * 1.5f, 0.1f).SetEase(Ease.InOutSine);
        yield return new WaitForSeconds(0.1f);

        // 缩小动画
        m_Times.transform.DOScale(Vector3.one, 0.1f).SetEase(Ease.InOutSine);
        yield return new WaitForSeconds(0.1f);
    }

    IEnumerator LoadAvatar(string url)
    {
        if (string.IsNullOrEmpty(url))
        {
            throw new ArgumentException("URL cannot be null or empty", nameof(url));
        }

        UnityWebRequest www = UnityWebRequestTexture.GetTexture(url);
        yield return www.SendWebRequest();

        if (www.result == UnityWebRequest.Result.Success)
        {
            Texture2D texture = DownloadHandlerTexture.GetContent(www);
            m_HeadImage.sprite = Sprite.Create(texture, new Rect(0, 0, texture.width, texture.height), Vector2.zero);
            m_HeadImage.enabled = true;
        }
        else
        {
            m_inited = false;
            Debug.LogErrorFormat("Failed to load avatar from {0}: {1}", url, www.error);
        }
    }
}
