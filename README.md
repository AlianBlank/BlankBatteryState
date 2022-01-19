# BlankBatteryState

用于在 Unity3D 中获取Android 和 iOS 平台上电池状态和电量值的插件

# Example 

> Return Result Fromat 返回值格式

> {"status":1,"value":100}

> status => 1 状态未知 2 电池充电中 3  放电中 4 未充电 5 满电量

> value => BatteryValue  电量值
> 
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
