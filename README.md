# BlankBatteryState

用于在 Unity3D 中获取Android 和 iOS 平台上电池状态和电量值的插件

# Docs
> [文档连接在这里](https://blog.alianhome.com/BlankBatteryState)

# Demo 

```csharp

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BlankBatteryStateExample : MonoBehaviour
{
    private string result = "";
    // Update is called once per frame
    void OnGUI()
    {
        if (GUILayout.Button("BlankBatteryState", GUILayout.Width(300), GUILayout.Height(200)))
        {
            try
            {
                result = BlankBatteryState.GetBatteryState();
            }
            catch (Exception e)
            {
                result = e.Message;
            }

        }
        GUILayout.Label(result);
    }
}

```
