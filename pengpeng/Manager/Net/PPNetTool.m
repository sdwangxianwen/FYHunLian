//
//  PPNetTool.m
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPNetTool.h"


@implementation PPNetTool

+(instancetype)share {
    static PPNetTool *netTool = nil ;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!netTool) {
            netTool = [[PPNetTool alloc] init];
        }
    });
    return netTool;
    
}

-(void)get:(NSString *)url parm:(NSDictionary *)parm modelClass:(Class)modelClass isCache:(BOOL)isCache isShowLoadHUD:(BOOL)isShowLoadHUD isShowErrorHUD:(BOOL)isShowErrorHUD success:(successBlock)success {
    [self get:url parm:parm tableView:nil modelClass:modelClass isCache:isCache isShowLoadHUD:isShowLoadHUD isShowErrorHUD:isShowErrorHUD success:success];
}

-(void)get:(NSString *)url parm:(NSDictionary *)parm tableView:(UITableView *)tableview modelClass:(Class)modelClass isCache:(BOOL)isCache isShowLoadHUD:(BOOL)isShowLoadHUD isShowErrorHUD:(BOOL)isShowErrorHUD success:(successBlock)success {
    if (tableview) {
        [tableview.mj_footer endRefreshing];
        [tableview.mj_header endRefreshing];
    }
    if (isShowLoadHUD) {
        [SVProgressHUD showWithStatus:@"加载中"];
    }
    NSString *userToken = [PPUser readUserToken];
    [FYNetworkHelper setValue:userToken?:@"" forHTTPHeaderField:@"userToken"];
    [FYNetworkHelper setRequestTimeoutInterval:5];
    [FYNetworkHelper GET:url parameters:parm isCache:isCache success:^(id responseObject) {
        if (isShowLoadHUD) {
            [SVProgressHUD dismiss];
        }
        PPBaseModel *baseModel = [PPBaseModel yy_modelWithJSON:responseObject];
        FYLog(@"%@",responseObject);
        if (baseModel.status == 2001 || baseModel.status == 200) {
            //成功的回调
            if ([responseObject[@"data"] isKindOfClass:[NSDictionary class]]) {
                PPBaseModel *model = [[modelClass class] yy_modelWithJSON:responseObject[@"data"]];
                success(model);
            }
           else if ([responseObject[@"data"] isKindOfClass:[NSNumber class]]) {
               PPBaseModel *model = [[modelClass class] yy_modelWithJSON:responseObject];
               success(model);
            } else {
                NSArray *arr = [NSArray yy_modelArrayWithClass:[modelClass class] json:responseObject[@"data"]];
                success(arr);
            }
            
        } else {
            //重试,展示错误信息
            [SVProgressHUD showErrorWithStatus:baseModel.msg];
            NSLog(@"%@",baseModel.msg);
        }
        
        
    } failure:^(NSError *error, id cacheReponse) {
        if (tableview) {
            [tableview.mj_footer endRefreshing];
            [tableview.mj_header endRefreshing];
        }
        if (isShowLoadHUD) {
            [SVProgressHUD dismiss];
        }
        //网络错误,展示缓存内容
        if (isShowErrorHUD) {
            [SVProgressHUD showErrorWithStatus:@"网络连接超时"];
        }
        if (isCache) {
            if ([cacheReponse[@"data"] isKindOfClass:[NSDictionary class]]) {
                PPBaseModel *model = [[modelClass class] yy_modelWithJSON:cacheReponse[@"data"]];
                success(model);
            } else {
                NSArray *arr = [NSArray yy_modelArrayWithClass:[modelClass class] json:cacheReponse[@"data"]];
                success(arr);
            }
        }
    }];
}

-(void)post:(NSString *)url parm:(NSDictionary *)parm modelClass:(Class)modelClass isCache:(BOOL)isCache isShowLoadHUD:(BOOL)isShowLoadHUD isShowErrorHUD:(BOOL)isShowErrorHUD success:(successBlock)success {
    [self post:url parm:parm tableView:nil modelClass:modelClass isCache:isCache isShowLoadHUD:isShowLoadHUD isShowErrorHUD:isShowErrorHUD success:success];
}

-(void)post:(NSString *)url parm:(NSDictionary *)parm tableView:(UITableView *)tableview modelClass:(Class)modelClass isCache:(BOOL)isCache isShowLoadHUD:(BOOL)isShowLoadHUD isShowErrorHUD:(BOOL)isShowErrorHUD success:(successBlock)success {
    if (tableview) {
        [tableview.mj_footer endRefreshing];
        [tableview.mj_header endRefreshing];
    }
    
    if (isShowLoadHUD) {
        [SVProgressHUD showWithStatus:@"加载中"];
    }
    [FYNetworkHelper setRequestSerializer:(FYRequestSerializerHTTP)];
    NSString *userToken = [PPUser readUserToken];
    [FYNetworkHelper setValue:userToken?:@"" forHTTPHeaderField:@"userToken"];
    [FYNetworkHelper setRequestTimeoutInterval:5];
    [FYNetworkHelper POST:url parameters:parm isCache:YES success:^(id responseObject) {
        if (isShowLoadHUD) {
            [SVProgressHUD dismiss];
        }
        PPBaseModel *baseModel = [PPBaseModel yy_modelWithJSON:responseObject];
        NSLog(@"%@",baseModel.msg);
        if (baseModel.status == 2001) {
            [PPUser saveInputInfo];
        }
        if (baseModel.status == 2001 || baseModel.status == 2002 ) {
            //成功的回调
            [SVProgressHUD showSuccessWithStatus:baseModel.msg];
            PPBaseModel *model = [[modelClass class] yy_modelWithJSON:responseObject[@"data"]];
            success(model);
        } else {
            //重试,展示错误信息
            [SVProgressHUD showErrorWithStatus:baseModel.msg];
            NSLog(@"%@",baseModel.msg);
        }
    } failure:^(NSError *error, id cacheReponse) {
        if (tableview) {
            [tableview.mj_footer endRefreshing];
            [tableview.mj_header endRefreshing];
        }
        if (isShowLoadHUD) {
            [SVProgressHUD dismiss];
        }
        //网络错误,展示缓存内容
        if (isShowErrorHUD) {
            [SVProgressHUD showErrorWithStatus:@"网络连接超时"];
        }
        if (isCache) {
            PPBaseModel *model = [[modelClass class] yy_modelWithJSON:cacheReponse[@"data"]];
            success(model);
        }
    }];
}


-(void)upLoadImag:(NSString *)url parm:(NSDictionary *)parm images:(NSArray *)images name:(NSString *)name modelClass:(Class)modelClass showView:(UIView *)showView isShowErrorHUD:(BOOL)isShowErrorHUD success:(successBlock)success {
    
    NSString *userToken = [PPUser readUserToken];
    [FYNetworkHelper setValue:userToken?:@"" forHTTPHeaderField:@"userToken"];
    [FYNetworkHelper uploadImagesWithURL:url parameters:parm name:name images:images fileNames:nil imageScale:0.5 imageType:@"png" progress:^(NSProgress *progress) {
        [SVProgressHUD showProgress:progress.completedUnitCount/progress.totalUnitCount];
        if (progress.completedUnitCount == 1) {
            [SVProgressHUD dismiss];
        }
    } success:^(id responseObject) {
         [SVProgressHUD dismiss];
        FYLog(@"%@",responseObject);
        [SVProgressHUD showSuccessWithStatus:@"上传成功"];
    } failure:^(NSError *error, id cacheReponse) {
         [SVProgressHUD dismiss];
        [SVProgressHUD showSuccessWithStatus:@"上传失败"];
    }];
    
}

-(void)upLoadImagWithUrl:(NSString *)url
                    parm:(NSDictionary *)parm
                    name:(NSString *)name
                  images:(NSArray *)images
               fileNames:(NSArray *)fileName
                showView:(UIView *)showView
                 success:(successBlock)success {
    [SVProgressHUD show];
    NSString *userToken = [PPUser readUserToken];
    [FYNetworkHelper setValue:userToken?:@"" forHTTPHeaderField:@"userToken"];
    [FYNetworkHelper uploadImagesWithURL:url parameters:parm name:name images:images fileNames:fileName imageScale:1 imageType:@"png,jpeg,jpg" progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        [SVProgressHUD dismiss];
        success(responseObject);
        [SVProgressHUD showSuccessWithStatus:@"上传成功"];
    } failure:^(NSError *error, id cacheReponse) {
        [SVProgressHUD dismiss];
    }];
}
@end
