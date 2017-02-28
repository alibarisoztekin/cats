//
//  CatPhoto.m
//  Cats
//
//  Created by Ali Barış Öztekin on 2017-02-27.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "CatPhoto.h"

@implementation CatPhoto


- (instancetype)initWithID:(NSString*) photoID owner:(NSString*)owner secret: (NSString*)secret server:(NSString*)server farm:(NSString*)farm title:(NSString*)title;
{
    self = [super init];
    if (self) {
        _photoID = photoID;
        _owner = owner;
        _secret = secret;
        _server = server;
        _farm = farm;
        _title = title;
    }
    return self;
}

@end

