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
