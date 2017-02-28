//
//  DownloadManager.m
//  Cats
//
//  Created by Ali Barış Öztekin on 2017-02-28.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "DownloadManager.h"

@implementation DownloadManager

+ (void)downloadImageFromURL:(NSURL *)url completion:(void (^)(UIImage *))completion {
    NSURLRequest* catRequest = [[NSURLRequest alloc] initWithURL:url];
    NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* catSession = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURLSessionDownloadTask* downloadTask = [catSession downloadTaskWithRequest:catRequest completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * downloadError) {
        if (downloadError) {
            NSLog(@"download error");
            return;
        }
        NSData* imageData = [NSData dataWithContentsOfURL:location];
        completion([UIImage imageWithData:imageData]);
    }];
    
    [downloadTask resume];
}

@end
