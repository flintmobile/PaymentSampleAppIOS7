//
//  AppDelegate.m
//  PaymentSampleAppiOS7
//
//  Created by PC on 9/18/15.
//  Copyright (c) 2015 Flint. All rights reserved.
//

#import "AppDelegate.h"
#import <FlintConnect/FlintConnect.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  /**
   * Starting Flint Service By Providing the configuration
   * There are also option to start Flint Service and Authenticate user at a later point in time
   * Simply not providing the username and passord here and user loginWithUsername:password:completion: method on FlintService
   */
  [FlintAPIConfig sharedInstance].APIKey = @"4d72de8c70d3ba2e0fef18bd6231bdb7";
  [FlintAPIConfig sharedInstance].environment = EnvironmentStaging;
  [FlintAPIConfig sharedInstance].username = @"test0001@mailinator.com";
  [FlintAPIConfig sharedInstance].password = @"T3st1ng1";
  
  [[FlintService sharedInstance] startServiceWithCompletion:^(FlintServiceStatus status, NSDictionary *userInfo) {
    
    NSError *error = [userInfo valueForKey:FlintServiceErrorKey];
    if (!error) {
      NSLog(@"==============SERVICE AUTHENTICATED AND START===================");
      
      FlintAccount *account = [userInfo valueForKey:FlintServiceAccountKey];
      NSLog(@"Authenticated Account:%@", account.key);
      
      FlintMerchant *merchant = [userInfo valueForKey:FlintServiceMerchantKey];
      NSLog(@"Merchant info:%@", [merchant businessName]);
      
      NSLog(@"====================END SERVICE INFO============================");
    } else {
      
      NSLog(@"Flint Service Error:%@", error);
    }
  }];
  
  /**
   * Providing the mechanism to customize the overall theme for the payment work flow
   * For individual component customization, use our Default.css in the SDK framework bundle
   */
  [FlintCSSEngine setThemeColorWithRed:20 green:255 blue:150 alpha:1.0f];
  return YES;
}

@end
