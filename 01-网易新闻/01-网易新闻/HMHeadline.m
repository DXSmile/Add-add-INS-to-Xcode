//
//  HMHeadline.m
//  01-网易新闻
//
//  Created by Apple on 15/10/28.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "HMHeadline.h"
#import "HMNetworkTools.h"
@implementation HMHeadline
+ (instancetype)headlineWithDic:(NSDictionary *)dic {
    HMHeadline *headline = [self new];
    [headline setValuesForKeysWithDictionary:dic];
    return headline;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

//发送异步请求，获取数据，字典转模型
+ (void)headlinesWithSuccess:(void(^)(NSArray *array))success error:(void(^)())error {
    NSLog(@"%s",__func__);
    [[HMNetworkTools sharedManager] GET:@"ad/headline/0-4.html" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        //获取返回的数组
        //获取字典的第一个键
        NSString *rootKey = responseObject.keyEnumerator.nextObject;
        NSArray *array = responseObject[rootKey];
        //字典转模型
        NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:4];
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HMHeadline *headline = [self headlineWithDic:obj];
            [mArray addObject:headline];
        }];
        //调用成功的回调
        if (success) {
            success(mArray.copy);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull er) {
        NSLog(@"%@",er);
        if (error) {
            error();
        }
    }];

}
@end
