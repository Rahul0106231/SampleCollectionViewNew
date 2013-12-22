//
//  CLViewController.h
//  SampleCollectionView
//
//  Created by Raahul on 22/12/13.
//  Copyright (c) 2013 Raahul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLCollectionViewLayout.h"

@interface CLViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>



@property (nonatomic,weak)IBOutlet UICollectionView *sampleCollectionView;
@property (nonatomic, weak) IBOutlet CLCollectionViewLayout *collectionViewLayout;
@property (nonatomic, strong) NSMutableArray *titleArray;


@end
