using System;
using System.Collections.Generic;

public class PriorityQueue<T>
{
    private List<KeyValuePair<T, int>> elements = new List<KeyValuePair<T, int>>();

    public int Count => elements.Count;

    public void Enqueue(T item, int priority)
    {
        elements.Add(new KeyValuePair<T, int>(item, priority));
        int i = elements.Count - 1;
        while (i > 0)
        {
            int parentIndex = (i - 1) / 2;
            if (elements[parentIndex].Value <= elements[i].Value)
            {
                break;
            }
            Swap(i, parentIndex);
            i = parentIndex;
        }
    }

    public T ExtractHighestPriority()
    {
        // 弹出优先级最高的元素
        if (elements.Count == 0)
        {
            throw new InvalidOperationException("Queue is empty");
        }
        T result = elements[0].Key;
        elements.RemoveAt(0);
        return result;
    }

    public T ExtractLowestPriority()
    {
        // 弹出优先级最低的元素
        if (elements.Count == 0)
        {
            throw new InvalidOperationException("Queue is empty");
        }
        T result = elements[elements.Count - 1].Key;
        elements.RemoveAt(elements.Count - 1);
        return result;
    }

    public IEnumerator<T> GetEnumerator()
    {
        foreach (KeyValuePair<T, int> pair in elements)
        {
            yield return pair.Key;
        }
    }

    public T GetElementByIndex(int i)
    {
        return elements[i].Key;
    }

    private void Swap(int i, int j)
    {
        KeyValuePair<T, int> temp = elements[i];
        elements[i] = elements[j];
        elements[j] = temp;
    }
}