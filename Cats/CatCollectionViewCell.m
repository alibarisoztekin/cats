//
//  CatCollectionViewCell.m
//  Cats
//
//  Created by Ali Barış Öztekin on 2017-02-27.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "CatCollectionViewCell.h"
#import "DownloadManager.h"

@interface CatCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *catImage;
@property (weak, nonatomic) IBOutlet UILabel *catLabel;


@end
@implementation CatCollectionViewCell


-(void)setModel:(CatPhoto *)model{
    _model=model;
    [self configureCell];
    
}

-(void)configureCell{
    if (!self.model.image) {
        
        [DownloadManager downloadImageFromURL:self.model.imageURL completion:^(UIImage *image) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                self.catImage.image = image;
            }];
        }];
    }
    self.catImage.image = self.model.image;
    self.catLabel.text = self.model.title;
}
@end
