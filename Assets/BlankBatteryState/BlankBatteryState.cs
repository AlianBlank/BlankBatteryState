using UnityEngine;
#if UNITY_IOS
using System.Runtime.InteropServices;
#endif
/// <summary>
/// 电池电量状态获取
/// </summary>
public sealed class BlankBatteryState
{

#if UNITY_IOS
	
	[DllImport("__Internal")]
	private static extern string getBatteryState();

#endif

    /// <summary>
    /// 获取电量数据   {"status":1,"value":100}
    /// status ==> 1 状态未知 2 电池充电中 3  放电中 4 未充电 5 满电量
    /// value  ==> 电量值
    /// </summary>
    public static string GetBatteryState()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
        AndroidJavaClass androidJavaClass = new AndroidJavaClass("com.alianhome.batterystate.MainActivity");
        return androidJavaClass.CallStatic<string>("GetBatteryState");
#elif UNITY_IOS && !UNITY_EDITOR
        return getBatteryState();
#else
        return "{\"status\":2,\"value\":50}";
#endif
    }
}
