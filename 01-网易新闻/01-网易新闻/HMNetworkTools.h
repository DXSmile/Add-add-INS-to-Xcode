//
//  HMNetworkTools.h
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface HMNetworkTools : AFHTTPSessionManager
+ (instancetype)sharedManager;
@end
