//
//  PPNetTool.h
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYNetWorkHelper.h"
#import "FYNetWorkCache.h"

typedef void(^successBlock)(id response);

NS_ASSUME_NONNULL_BEGIN

@interface PPNetTool : NSObject
+(instancetype)share;

/**
 get请求
 @param url 请求地址
 @param parm 请求参数
 @param modelClass 请求返回的模型类型
 @param isCache 是否需要缓存s
 @param isShowLoadHUD 是否显示加载HUD
 @param isShowErrorHUD 是否显示错误HUD
 @param success 成功的回调
 */
-(void)get:(NSString *)url parm:(NSDictionary *)parm modelClass:(Class)modelClass isCache:(BOOL)isCache isShowLoadHUD:(BOOL)isShowLoadHUD isShowErrorHUD:(BOOL)isShowErrorHUD success:(successBlock)success;
-(void)get:(NSString *)url parm:(NSDictionary *)parm tableView:(UITableView *__nullable)tableview modelClass:(Class)modelClass isCache:(BOOL)isCache isShowLoadHUD:(BOOL)isShowLoadHUD isShowErrorHUD:(BOOL)isShowErrorHUD success:(successBlock)success;

/**
 post请求
 @param url 请求地址
 @param parm 请求参数
 @param modelClass 请求返回的模型类型
 @param isCache 是否需要缓存s
 @param isShowLoadHUD 是否显示加载HUD
 @param isShowErrorHUD 是否显示错误HUD
 @param success 成功的回调
 */
-(void)post:(NSString *)url parm:(NSDictionary *)parm modelClass:(Class)modelClass isCache:(BOOL)isCache isShowLoadHUD:(BOOL)isShowLoadHUD isShowErrorHUD:(BOOL)isShowErrorHUD success:(successBlock)success;
-(void)post:(NSString *)url parm:(NSDictionary *)parm tableView:(UITableView * __nullable)tableview modelClass:(Class)modelClass isCache:(BOOL)isCache isShowLoadHUD:(BOOL)isShowLoadHUD isShowErrorHUD:(BOOL)isShowErrorHUD success:(successBlock)success;

-(void)upLoadImag:(NSString *)url parm:(NSDictionary *)parm images:(NSArray *)images name:(NSString *)name modelClass:(Class)modelClass showView:(UIView *)showView isShowErrorHUD:(BOOL)isShowErrorHUD success:(successBlock)success;



-(void)upLoadImagWithUrl:(NSString *)url
                    parm:(NSDictionary *)parm
                    name:(NSString *)name
                  images:(NSArray *)images
               fileNames:(NSArray *)fileName
                showView:(UIView *__nullable)showView
                 success:(successBlock)success;


@end

NS_ASSUME_NONNULL_END
