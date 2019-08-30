#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if defined (__cplusplus)
extern "C" {
#endif
    char * getBatteryState();
#if defined (__cplusplus)
}
#endif

char * getBatteryState() {
    
    UIDevice * device = [UIDevice currentDevice];
    [device setBatteryMonitoringEnabled:YES];
    float bat =  [device batteryLevel];
    
    UIDeviceBatteryState  batstate=  [[UIDevice currentDevice] batteryState];
    NSMutableDictionary * result= [NSMutableDictionary new];
        // 设置电量值
    NSNumber * bat_value = [NSNumber numberWithFloat: bat * 100];
    [result setValue:bat_value forKey:@"value"];
    switch (batstate) {
        case UIDeviceBatteryStateFull:
                //  充电中  电量满
            [result setValue:@5 forKey:@"status"];
            break;
        case UIDeviceBatteryStateUnplugged:
                // 没有充电
            [result setValue:@3 forKey:@"status"];
            break;
        case UIDeviceBatteryStateCharging:
                // 充电中，电量未满
            [result setValue:@2 forKey:@"status"];
            break;
        default:
                //充电状态未知
            [result setValue:@1 forKey:@"status"];
            break;
    }
        // JSON 序列化
    NSData * jsonData=  [NSJSONSerialization  dataWithJSONObject:result options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    const char *charstr = [jsonString UTF8String];
        // alloc
    char *resultChar = (char*)malloc(strlen(charstr)+1);
        // copy
    strcpy(resultChar, charstr);
    
    return resultChar;
}


