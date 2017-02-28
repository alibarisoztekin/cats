//
//  DataManager.m
//  Cats
//
//  Created by Ali Barış Öztekin on 2017-02-27.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "DataManager.h"
#import "CatPhoto.h"

@implementation DataManager

+(void) getCatArrayFromJSON{
    
    NSMutableArray* catArray = [NSMutableArray new];
    
    NSURL* flickrURL =[NSURL URLWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=1&api_key=4aeaceb55adde2a2ff636af2007343a2&tags=cat"];
    NSURLRequest* flickrRequest = [[NSURLRequest alloc] initWithURL:flickrURL];
    
    NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:flickrRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        for (NSDictionary* photo in json[@"photos"][@"photo"]) {
            CatPhoto *catPhoto = [[CatPhoto alloc] initWithID:photo[@"id"] owner:photo[@"owner"] secret:photo[@"secret"] server:photo[@"server"] farm:photo[@"farm"] title:photo[@"title"]];
            [catArray addObject:catPhoto];
            catPhoto.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg",catPhoto.farm,catPhoto.server,catPhoto.photoID,catPhoto.secret]];
        }
        NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter postNotificationName:@"catArrayReady" object:self userInfo:@{@"key":catArray}];
    }];
    [dataTask resume];
    
}



@end
