using Cinemachine;
using UnityEngine;
using System.Collections;
using DG.Tweening;
using System;
using System.Collections.Generic;

[ExecuteAlways]
public class UseItemNotifyManager : MonoBehaviour
{
    static UseItemNotifyManager instance;
    public static UseItemNotifyManager Instance
    {
        get
        {
            return instance;
        }
    }
    public Transform m_Item1;
    public Transform m_Item2;

    public List<NotifyItemData> m_ItemDataList = new List<NotifyItemData>();

    public GameObject[] m_NotifyItems;

    PriorityQueue<NotifyItemData> queue = new PriorityQueue<NotifyItemData>();
    IEnumerator coroutine;

    //队列里最多存10个数据
    private int m_MaxCapacity = 10;

    void Awake()
    {
        instance = this;
    }

    public void Show(NotifyItemData notifyData)
    {
        TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
        notifyData.curtime = Convert.ToInt64(ts.TotalMilliseconds);
        bool isFind = false;
        for (int i = 0; i < queue.Count; i ++)
        {
            NotifyItemData item = queue.GetElementByIndex(i);
            if (item.openid == notifyData.openid && item.notifyType == notifyData.notifyType)
            {
                item.curtime = Convert.ToInt64(ts.TotalMilliseconds);
                item.times ++;
                isFind = true;
                break;
            }
        }
        for (int i = 0; i < m_ItemDataList.Count; i++)
        {
            NotifyItemData item = m_ItemDataList[i];
            if (item.openid == notifyData.openid && item.notifyType == notifyData.notifyType)
            {
                item.curtime = Convert.ToInt64(ts.TotalMilliseconds);
                item.times++;
                isFind = true;
                break;
            }
        }
        if (!isFind)
        {
            queue.Enqueue(notifyData, 0);
        }
        if (queue.Count > m_MaxCapacity)
        {
            queue.ExtractLowestPriority();
        }
    }

    void Update()
    {
        if (coroutine == null)
        {
            coroutine = Process();
        }
        coroutine.MoveNext();
    }

    IEnumerator Process()
    {
        while (true)
        {
            if (queue.Count > 0 && (m_Item1.childCount < 1 || m_Item2.childCount < 1))
            {
                NotifyItemData notifyData = queue.ExtractHighestPriority();
                GameObject obj = Instantiate(this.m_NotifyItems[(int)notifyData.notifyType]) as GameObject;
                if (m_Item1.childCount < 1)
                {
                    
                    obj.transform.SetParent(m_Item1);
                }
                else
                {
                    obj.transform.SetParent(m_Item2);
                }
                m_ItemDataList.Add(notifyData);
                obj.transform.localScale = Vector3.one;
                obj.transform.localPosition = new Vector3(-500,0,0);
                obj.GetComponent<NotifyItem>().ShowInfo(notifyData);

                obj.transform.DOLocalMoveX(0,0.5f);
                StartCoroutine(DelayedDestroy(obj, notifyData));

            }
            yield return null;
        }
    }

    IEnumerator DelayedDestroy(GameObject obj, NotifyItemData notifyData)
    {
        while (true)
        {
            obj.GetComponent<NotifyItem>().RefreshTimes();
            TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            if (Convert.ToInt64(ts.TotalMilliseconds) - notifyData.curtime > 2.5*1000)
            {
                break;
            }
            yield return null;
        }
        m_ItemDataList.Remove(notifyData);
        Destroy(obj);
    }
}