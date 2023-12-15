using Assets.Scripts.Runtime.Network;
using Forevernine.Garfield.Proto;
using UnityEngine;
using static Codice.CM.WorkspaceServer.WorkspaceTreeDataStore;

public enum ItemType
{
    // 加速
    SpeedUp,
    // 香蕉派
    Pie,
    // 香水
    Perfume,
    // UFO
    UFO,
    // MilleFeuille
    MilleFeuille,
    // 枕头
    Pillow,
    // 魔法棒
    MagicWand,
    // 大枕头
    PillowPlus
}

public class UseItemManager : MonoBehaviour
{
    static UseItemManager instance;
    public static UseItemManager Instance
    {
        get
        {
            if (instance == null)
            {
                instance = FindObjectOfType<UseItemManager>();
            }
            return instance;
        }
    }

    public Race Race;

    void Awake()
    {
        instance = this;
    }

    public void UseItem(string id, ItemType itemType)
    {
        NotifyItemData notifyData = new NotifyItemData();
        if (Server.Instance.TryGetRole(id, out var gameRole))
        {
            notifyData.avatarurl = gameRole.Avatar;
            notifyData.nickname = gameRole.NickName;
            notifyData.tip = "这是提示";
            notifyData.times = 1;
            notifyData.openid = id;
        }
        switch (itemType)
        {
            case ItemType.MilleFeuille:
                {
                    Item item = gameObject.AddComponent<SpeedUpItem>();
                    item.Race = Race;
                    item.Car = Race.GetCar(id);
                    notifyData.notifyType = NotifyType.MilleFeuille;
                }
                break;
            case ItemType.Pie:
                {
                    Race.GetCar(id).PieCount++;
                    Item item = gameObject.AddComponent<PieItem>();
                    item.Race = Race;
                    item.Car = Race.GetCar(id);
                    notifyData.notifyType = NotifyType.Pie;
                }
                break;
            case ItemType.Perfume:
                {
                    Item item = gameObject.AddComponent<Perfume>();
                    item.Race = Race;
                    item.Car = Race.GetCar(id);
                    notifyData.notifyType = NotifyType.Perfume;
                }
                break;
            case ItemType.Pillow:
                {
                    Race.GetCar(id).PillowCount++;
                    if (Race.GetCar(id).PillowCount % 9  == 0)
                    {
                        Item item = gameObject.AddComponent<PillowPlusItem>();
                        item.Race = Race;
                        item.Car = Race.GetCar(id);
                    }
                    else
                    {
                        Item item = gameObject.AddComponent<PillowItem>();
                        item.Race = Race;
                        item.Car = Race.GetCar(id);
                    }
                    notifyData.notifyType = NotifyType.Pillow;
                }
                break;
            case ItemType.MagicWand:
                {
                    Item item = gameObject.AddComponent<MagicWand>();
                    item.Race = Race;
                    item.Car = Race.GetCar(id);
                    notifyData.notifyType = NotifyType.MagicWand;
                }
                break;
            case ItemType.PillowPlus:
                {
                    Item item = gameObject.AddComponent<PillowPlusItem>();
                    item.Race = Race;
                    item.Car = Race.GetCar(id);
                }
                break;
            default:
                break;
        }
        UseItemNotifyManager.Instance.Show(notifyData);
    }
}
