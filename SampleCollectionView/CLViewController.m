//
//  CLViewController.m
//  SampleCollectionView
//
//  Created by Raahul on 22/12/13.
//  Copyright (c) 2013 Raahul. All rights reserved.
//

#import "CLViewController.h"
#import "CLCollectionViewCell.h"
#define numberOfColumns 15;

@interface CLViewController ()

@end

@implementation CLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Grid View";
    self.view.backgroundColor = [UIColor redColor];
    [self.sampleCollectionView registerNib:[UINib nibWithNibName:@"SampleCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    self.navigationItem.title = @"Sample Grid View";
    
   // self.sampleCollectionView.collectionViewLayout = [[CLCollectionViewLayout alloc] init];
    self.sampleCollectionView.backgroundColor = [UIColor clearColor];
    self.sampleCollectionView.dataSource = self;
    self.sampleCollectionView.delegate = self;
    
    self.titleArray = [NSMutableArray arrayWithObjects:@"Trade",@"Status",@"Order type",@"ilakathamaf",@"kya hai yeh",@"borrre",@"borrre",@"borrre",@"borrre",@"borrre",@"borrre",@"borrre",@"borrre",@"borrre",@"borrre", nil];
    
    

    
	// Do any additional setup after loading the view, typically from a nib.
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [self.collectionViewLayout invalidateLayout];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
   // [self.collectionViewLayout invalidateLayout];
    return 2;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section == 0) {
       
        return 15;
    }
    else {
        
        return 15*numberOfColumns;
        
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if(indexPath.section == 0) {
        cell.textLabel.font = [UIFont fontWithName:@"Futura" size:11.0f];
        cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.item];
        cell.backgroundColor = [UIColor darkGrayColor];
        
    }
    else {
        cell.textLabel.text = @"SampleText";
        cell.backgroundColor = [UIColor lightGrayColor];
        
        
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
