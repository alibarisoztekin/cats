//
//  DownloadManager.h
//  Cats
//
//  Created by Ali Barış Öztekin on 2017-02-28.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadManager : NSObject

+ (void)downloadImageFromURL:(NSURL *)url completion:(void (^)(UIImage *))completion;

@end
