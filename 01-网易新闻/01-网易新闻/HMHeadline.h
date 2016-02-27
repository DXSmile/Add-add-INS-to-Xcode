//
//  HMHeadline.h
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMHeadline : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imgsrc;

+ (instancetype)headlineWithDic:(NSDictionary *)dic;
//发送异步请求，获取数据，字典转模型
+ (void)headlinesWithSuccess:(void(^)(NSArray *array))success error:(void(^)())error;
@end
