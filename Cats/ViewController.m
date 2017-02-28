//
//  ViewController.m
//  Cats
//
//  Created by Ali Barış Öztekin on 2017-02-27.
//  Copyright © 2017 Ali Barış Öztekin. All rights reserved.
//

#import "ViewController.h"
#import "CatPhoto.h"
#import "DataManager.h"
#import "CatCollectionViewCell.h"



static NSString * const kCellIdentifier = @"catCell";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSArray<CatPhoto*>* catArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter* notificationCenter = [NSNotificationCenter defaultCenter];
    [DataManager getCatArrayFromJSON];
    [notificationCenter addObserverForName:@"catArrayReady" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification* notification ){
        NSDictionary* tempDictionary= notification.userInfo;
        self.catArray = tempDictionary[@"key"];
        [self.collectionView reloadData];
    }];
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.catArray.count;
}



-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CatCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.model = self.catArray[indexPath.item];
    return cell;
}






@end
