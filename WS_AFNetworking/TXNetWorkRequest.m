//
//  TXNetWorkManager.m
//  appDoctor
//
//  Created by TX-009 on 14-10-30.
//  Copyright (c) 2014年 TX-009. All rights reserved.
//

#import "TXNetWorkRequest.h"
#import <UIProgressView+AFNetworking.h>
#import "WSNetworkHeader.h"
#define kTXLiabray @"TXLiabrary"
@implementation TXNetWorkRequest
//get请求
+(AFHTTPRequestOperation *)get:(NSString *)urlString parameters:(NSDictionary *)param done:(ApiDoneCallback)doneCallback error:(ApiErrorCallback)errorCallback{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    return [manager GET:[TXNetWorkRequest urlStringDecorate:urlString] parameters:[TXNetWorkRequest paramDecorate:param] success:doneCallback failure:errorCallback];
}

+(void)ws_get:(NSString *)urlString parameters:(NSDictionary *)param shouldShowAnimation:(BOOL)sholdShowAnimation fromController:(TXBaseViewController *)txController done:(ApiDoneCallback_tx)doneCallback_tx error:(ApiErrorCallback_tx)errorCallback_tx
{
    [TXNetWorkRequest get:urlString parameters:param done:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         //请求成功
         if ([responseObject isKindOfClass:[NSDictionary class]])
         {
             //服务器返回正确结果
             if ([responseObject[@"success"] intValue])
             {
                 //do here
                 NSDictionary *dataDic = (NSDictionary *)responseObject;
                 if (doneCallback_tx) {
                     doneCallback_tx(operation,dataDic,txController);
                 }
                
             }
         }
         
     } error:^(AFHTTPRequestOperation *operation, NSError *error) {

         //网络错误
        if (errorCallback_tx) {
             errorCallback_tx(operation,error,txController);
         }
     }];
}




//post请求
+(AFHTTPRequestOperation *)post:(NSString *)urlString parameters:(NSDictionary *)param done:(ApiDoneCallback)doneCallback error:(ApiErrorCallback)errorCallback{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    return [manager POST:[TXNetWorkRequest urlStringDecorate:urlString] parameters:[TXNetWorkRequest paramDecorate:param] success:doneCallback failure:errorCallback];
}
+(void)ws_post:(NSString *)urlString parameters:(NSDictionary *)param shouldShowAnimation:(BOOL)sholdShowAnimation fromController:(TXBaseViewController *)txController done:(ApiDoneCallback_tx)doneCallback_tx error:(ApiErrorCallback_tx)errorCallback_tx
{
    
    [TXNetWorkRequest post:urlString parameters:param done:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         //请求成功
         if ([responseObject isKindOfClass:[NSDictionary class]])
         {
             //服务器返回正确结果
             if ([responseObject[@"success"] intValue])
             {
                 //do here
                 NSDictionary *dataDic = (NSDictionary *)responseObject;
                 if (doneCallback_tx) {
                     doneCallback_tx(operation,dataDic,txController);
                 }
             }
             
         }
     } error:^(AFHTTPRequestOperation *operation, NSError *error) {
         //网络错误
         if (errorCallback_tx) {
             errorCallback_tx(operation,error,txController);
         }
     }];
}


//put请求
+(AFHTTPRequestOperation *)put:(NSString *)urlString parameters:(NSDictionary *)param done:(ApiDoneCallback)doneCallback error:(ApiErrorCallback)errorCallback{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    return [manager PUT:[TXNetWorkRequest urlStringDecorate:urlString] parameters:[TXNetWorkRequest paramDecorate:param] success:doneCallback failure:errorCallback];
}
+(void)ws_put:(NSString *)urlString parameters:(NSDictionary *)param shouldShowAnimation:(BOOL)sholdShowAnimation fromController:(TXBaseViewController *)txController done:(ApiDoneCallback_tx)doneCallback_tx error:(ApiErrorCallback_tx)errorCallback_tx
{
    [TXNetWorkRequest put:urlString parameters:param done:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         //请求成功
         if ([responseObject isKindOfClass:[NSDictionary class]])
         {
             //服务器返回正确结果
             if ([responseObject[@"success"] intValue])
             {
                 //do here
                 NSDictionary *dataDic = (NSDictionary *)responseObject;
                 if (doneCallback_tx) {
                     doneCallback_tx(operation,dataDic,txController);
                 }
                 
             }
         }
         
     } error:^(AFHTTPRequestOperation *operation, NSError *error) {
         //网络错误
         if (errorCallback_tx) {
             errorCallback_tx(operation,error,txController);
         }
     }];
}
//patch请求
+(AFHTTPRequestOperation *)patch:(NSString *)urlString parameters:(NSDictionary *)param done:(ApiDoneCallback)doneCallback error:(ApiErrorCallback)errorCallback{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    return [manager PATCH:[TXNetWorkRequest urlStringDecorate:urlString] parameters:[TXNetWorkRequest paramDecorate:param] success:doneCallback failure:errorCallback];
}
//delete 请求
+(AFHTTPRequestOperation *)delete1:(NSString *)urlString parameters:(NSDictionary *)param done:(ApiDoneCallback)doneCallback error:(ApiErrorCallback)errorCallback{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    return [manager DELETE:[TXNetWorkRequest urlStringDecorate:urlString] parameters:[TXNetWorkRequest paramDecorate:param] success:doneCallback failure:errorCallback];
}
+(void)ws_delete:(NSString *)urlString parameters:(NSDictionary *)param shouldShowAnimation:(BOOL)sholdShowAnimation fromController:(TXBaseViewController *)txController done:(ApiDoneCallback_tx)doneCallback_tx error:(ApiErrorCallback_tx)errorCallback_tx
{
    [TXNetWorkRequest delete1:urlString parameters:param done:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         //请求成功
         if ([responseObject isKindOfClass:[NSDictionary class]])
         {
             //服务器返回正确结果
             if ([responseObject[@"success"] intValue])
             {
                 //do here
                 NSDictionary *dataDic = (NSDictionary *)responseObject;
                 if (doneCallback_tx) {
                     doneCallback_tx(operation,dataDic,txController);
                 }
                 
             }
        }
         
     } error:^(AFHTTPRequestOperation *operation, NSError *error) {
         //网络错误
         if (errorCallback_tx) {
             errorCallback_tx(operation,error,txController);
         }
     }];
}


#pragma mark - 网络请求参数设置修饰等
+ (NSString *)urlStringDecorate:(NSString *)urlString
{
    NSLog(@"%@",[NSMutableString stringWithFormat:@"%@%@",HOST_URL,urlString]);
    return [NSMutableString stringWithFormat:@"%@%@",HOST_URL,urlString];
}
+ (NSDictionary *)paramDecorate:(NSDictionary *)paramDic
{
    NSMutableDictionary *dicM;
    if (paramDic) {
        dicM = [NSMutableDictionary dictionaryWithDictionary:paramDic];
    }
    else
    {
        dicM = [NSMutableDictionary dictionary];
    }
    return dicM;
}



#pragma mark - POST上传
+ (void)ws_postUploadWithUrl:(NSString *)urlString parameters:(id)params shouldShowAnimation:(BOOL)sholdShowAnimation fromController:(TXBaseViewController *)txController done:(ApiDoneCallback_tx)doneCallback_tx error:(ApiErrorCallback_tx)errorCallback_tx
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    //设置返回的数据解析格式
    // 实际上就是AFN没有对响应数据做任何处理的情况
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // formData是遵守了AFMultipartFormData的对象
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    NSMutableDictionary *paramDicM = [NSMutableDictionary dictionary];
    NSArray *keys = [params allKeys];
    for (NSString *oneKey in keys) {
        if (![[params objectForKey:oneKey] isKindOfClass:[NSData class]]) {
            if ([[params objectForKey:oneKey] isKindOfClass:[NSArray class]]) {
                if (![[params objectForKey:oneKey][0] isKindOfClass:[NSData class]]) {
                    [paramDicM setObject:[params objectForKey:oneKey] forKey:oneKey];
                }
                else
                {
                    [dataDic setObject:[params objectForKey:oneKey] forKey:oneKey];
                }
            }
            else
            {
                [paramDicM setObject:[params objectForKey:oneKey] forKey:oneKey];
            }
        }
        else
        {
            [dataDic setObject:[params objectForKey:oneKey] forKey:oneKey];
        }
        
    }
    //post方法进行图片上传
    AFHTTPRequestOperation *operation = [manager POST:[TXNetWorkRequest urlStringDecorate:urlString] parameters:paramDicM constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //如果要上传多张图片把下面两句代码放到for循环里即可
        {
            NSArray *dataKeys = [dataDic allKeys];
            for (NSString *oneK in dataKeys) {
                if ([[dataDic objectForKey:oneK] isKindOfClass:[NSData class]]) {
                    [formData appendPartWithFileData:[dataDic objectForKey:oneK] name:oneK fileName:@"status.jpg" mimeType:@"image/jpeg"];
                }
                else if ([[dataDic objectForKey:oneK] isKindOfClass:[NSArray class]])
                {
                    NSArray *allValues = (NSArray *)[dataDic objectForKey:oneK];

                    for (int i = 0; i < allValues.count ; i++) {
                        NSData *oneV = allValues[i];
                        [formData appendPartWithFileData:oneV name:[NSString stringWithFormat:@"%@[]",oneK] fileName:[NSString stringWithFormat:@"%@%d.jpg",@"status",i] mimeType:@"image/jpeg"];
                    }
                }
            }

        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //do here
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *dataDic = (NSDictionary *)responseObject;
            //服务器返回正确结果
            if ([dataDic[@"success"] intValue])
            {
                
                if (doneCallback_tx) {
                    doneCallback_tx(operation,dataDic,txController);
                }
            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //网络错误
        if (errorCallback_tx) {
            errorCallback_tx(operation,error,txController);
        }
        NSLog(@"错误 %@", error.localizedDescription);
    }];
    
    //获得上传进度
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        NSLog(@"百分比:%f",totalBytesWritten*1.0/totalBytesExpectedToWrite);
    }];
        
}



#pragma mark - 下载文件
//+ (void)txFileDownLoadWithTXLibraryType:(TXLibraryType)txLibraryType
//{
//    
//    NSString *urlString = [TXNetWorkRequest urlStringFromTXLiabrary:txLibraryType];
//    
//    
//    
//    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    
//    NSURL *url = [NSURL URLWithString:[TXNetWorkRequest urlStringDecorate:urlString]];
//    TXLog(@"%@",[TXNetWorkRequest urlStringDecorate:urlString]);
//    // http://www.w3hacker.com/wp-content/uploads/2013/10/180.jpg
//    // http://cdn.sencha.com/ext/gpl/ext-4.2.1-gpl.zip
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
//        
//        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//        
//        [NSFileManager ws_createFolder:kTXLiabray atPath:docPath];
//        
//        NSURL *documentsDirectoryPath = [NSURL fileURLWithPath:[docPath stringByAppendingPathComponent:kTXLiabray]];
//        NSURL *savePath = [documentsDirectoryPath URLByAppendingPathComponent:[[response suggestedFilename] ws_md5_encrypt]];
//        [[NSFileManager defaultManager] removeItemAtURL:savePath error:nil];
//        return savePath;
//    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
//        NSLog(@"File downloaded to: %@", filePath);
//        NSData *data = [[NSData alloc] initWithContentsOfURL:filePath];
//        data = [data ws_aesEncryptWithKey:kTXLiabraryAECEncyptPassword];
//        [[NSFileManager defaultManager] removeItemAtPath:filePath.path error:nil];
//        [data writeToURL:filePath atomically:YES];
//        
//        ZipArchive *zipArchive = [[ZipArchive alloc] init];
//        
//        NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//        NSString *zipFilePath = [[documentPath stringByAppendingPathComponent:kTXLiabray] stringByAppendingPathComponent:[response.suggestedFilename ws_md5_encrypt]];
//        zipFilePath = [zipFilePath stringByAppendingPathExtension:@"zip"];
//        [zipArchive CreateZipFile2:zipFilePath];
//        [zipArchive addFileToZip:filePath.path newname:[response.suggestedFilename ws_md5_encrypt]];
//        [zipArchive CloseZipFile2];
//        [[NSFileManager defaultManager] removeItemAtPath:filePath.path error:nil];
//        //        data = [[NSData alloc] initWithContentsOfURL:filePath];
//        //        NSDictionary *dic = [[[NSString alloc] initWithData:[data ws_aesDecryptWithKey:kTXLiabraryAECEncyptPassword] encoding:NSUTF8StringEncoding] jsonObject_tx];
//        //        NSLog(@"%@",dic);
//    }];
//    
//    [downloadTask resume];
//    
//    //    UIProgressView *progressView ;
//    //    [progressView setProgressWithDownloadProgressOfTask:downloadTask animated:YES];
//    
//}
@end
