#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <flutter_local_notifications/FlutterLocalNotificationsPlugin.h>

@implementation AppDelegate

void registerPlugins(NSObject<FlutterPluginRegistry>* registry) {
    [GeneratedPluginRegistrant registerWithRegistry:registry];
}

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [FlutterLocalNotificationsPlugin setPluginRegistrantCallback:registerPlugins];

    
    if (@available(iOS 10.0, *)) {
      [UNUserNotificationCenter currentNotificationCenter].delegate = (id<UNUserNotificationCenterDelegate>) self;
    }

  [GeneratedPluginRegistrant registerWithRegistry:self];
//   Override point for customization after application launch.
//    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
//      GeneratedPluginRegistrant.register(with: registry)
//    }
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
