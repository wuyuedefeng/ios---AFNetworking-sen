//
//  TXNetWorkManager.h
//  appDoctor
//
//  Created by TX-009 on 14-10-30.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TXBaseViewController.h"
#import <AFNetworking.h>
@interface TXNetWorkRequest : NSObject
typedef void (^ApiDoneCallback)(AFHTTPRequestOperation*operation, id responseObject);
typedef void (^ApiErrorCallback)(AFHTTPRequestOperation*operation, NSError *error);

typedef void (^ApiDoneCallback_tx)(AFHTTPRequestOperation*operation, NSDictionary *dataDic, TXBaseViewController *txController);
typedef void (^ApiErrorCallback_tx)(AFHTTPRequestOperation*operation, NSError *error, TXBaseViewController *txController);


typedef void (^ApiFormDo_tx)(id <AFMultipartFormData> formData, TXBaseViewController *txController);

//get请求
+(AFHTTPRequestOperation *)get:(NSString *)urlString parameters:(NSDictionary *)param done:(ApiDoneCallback)doneCallback error:(ApiErrorCallback)errorCallback;
+(void)tx_get:(NSString *)urlString parameters:(NSDictionary *)param shouldShowAnimation:(BOOL)sholdShowAnimation fromController:(TXBaseViewController *)txController done:(ApiDoneCallback_tx)doneCallback_tx error:(ApiErrorCallback_tx)errorCallback_tx;
//post请求
+(AFHTTPRequestOperation *)post:(NSString *)urlString parameters:(NSDictionary *)param done:(ApiDoneCallback)doneCallback error:(ApiErrorCallback)errorCallback;
+(void)tx_post:(NSString *)urlString parameters:(NSDictionary *)param shouldShowAnimation:(BOOL)sholdShowAnimation fromController:(TXBaseViewController *)txController done:(ApiDoneCallback_tx)doneCallback_tx error:(ApiErrorCallback_tx)errorCallback_tx;
//put请求
+(AFHTTPRequestOperation *)put:(NSString *)urlString parameters:(NSDictionary *)param done:(ApiDoneCallback)doneCallback error:(ApiErrorCallback)errorCallback;
+(void)tx_put:(NSString *)urlString parameters:(NSDictionary *)param shouldShowAnimation:(BOOL)sholdShowAnimation fromController:(TXBaseViewController *)txController done:(ApiDoneCallback_tx)doneCallback_tx error:(ApiErrorCallback_tx)errorCallback_tx;
//patch请求
+(AFHTTPRequestOperation *)patch:(NSString *)urlString parameters:(NSDictionary *)param done:(ApiDoneCallback)doneCallback error:(ApiErrorCallback)errorCallback;
//delete 请求
+(AFHTTPRequestOperation *)delete1:(NSString *)urlString parameters:(NSDictionary *)param done:(ApiDoneCallback)doneCallback error:(ApiErrorCallback)errorCallback;
+(void)tx_delete:(NSString *)urlString parameters:(NSDictionary *)param shouldShowAnimation:(BOOL)sholdShowAnimation fromController:(TXBaseViewController *)txController done:(ApiDoneCallback_tx)doneCallback_tx error:(ApiErrorCallback_tx)errorCallback_tx;

#pragma mark －pic upload and dic
#pragma mark - POST上传
+ (void)tx_postUploadWithUrl:(NSString *)urlString parameters:(id)params shouldShowAnimation:(BOOL)sholdShowAnimation fromController:(TXBaseViewController *)txController done:(ApiDoneCallback_tx)doneCallback_tx error:(ApiErrorCallback_tx)errorCallback_tx;

+ (NSString *)urlStringDecorate:(NSString *)urlString;

@end
