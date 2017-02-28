//
//  CatCollectionViewCell.h
//  Cats
//
//  Created by Ali Barış Öztekin on 2017-02-27.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CatPhoto.h"



@interface CatCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) CatPhoto* model;
@end
