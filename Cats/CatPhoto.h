//
//  CatPhoto.h
//  Cats
//
//  Created by Ali Barış Öztekin on 2017-02-27.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CatPhoto : NSObject

@property (nonatomic,strong) NSString* photoID;
@property (nonatomic,strong) NSString* owner;
@property (nonatomic,strong) NSString* secret;
@property (nonatomic,strong) NSString* server;
@property (nonatomic,assign) NSString* farm;
@property (nonatomic,strong) NSString* title;

@property (nonatomic,strong) UIImage* image;
@property (nonatomic,strong) NSURL* imageURL;

- (instancetype)initWithID:(NSString*) photoID owner:(NSString*)owner secret: (NSString*)secret server:(NSString*)server farm:(NSString*)farm title:(NSString*)title;


@end
