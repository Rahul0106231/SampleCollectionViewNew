//
//  CLCollectionViewLayout.m
//  SampleCollectionView
//
//  Created by Raahul on 22/12/13.
//  Copyright (c) 2013 Raahul. All rights reserved.
//

#import "CLCollectionViewLayout.h"

@interface CLCollectionViewLayout ()

@property (strong, nonatomic) NSMutableArray *itemAttributes;
@property (nonatomic, assign) CGSize contentSize;

@end


@implementation CLCollectionViewLayout


-(void)prepareLayout
{
    [self setItemAttributes:nil];
    _itemAttributes = [[NSMutableArray alloc] init];
    [self setItemOffset:UIOffsetMake(1.0, 1.0)];
    
    NSUInteger column = 0;
    
    CGFloat xOffset = _itemOffset.horizontal;
    CGFloat yOffset = _itemOffset.vertical;
    CGFloat rowHeight = 0.0;
    
    CGFloat contentWidth = 0.0;         // Used to determine the contentSize
    CGFloat contentHeight = 0.0;        // Used to determine the contentSize
    
    // We'll create a dynamic layout. Each row will have a random number of columns
    NSUInteger numberOfColumnsInRow = [self.collectionView numberOfItemsInSection:0];
    NSUInteger numberOfItems = ([self.collectionView numberOfItemsInSection:0] + [self.collectionView numberOfItemsInSection:1]);
    
    for (NSUInteger index = 0; index < numberOfItems; index++)
    {
        CGSize itemSize = CGSizeMake(96,51);
        if (itemSize.height > rowHeight)
            rowHeight = itemSize.height;
        
        // Create the actual UICollectionViewLayoutAttributes and add it to your array. We'll use this later in layoutAttributesForItemAtIndexPath:
        NSIndexPath *indexPath;
        if(index < 15) {
            
           indexPath = [NSIndexPath indexPathForItem:index inSection:0];
            
        }
        else {
            
          // index = index-15;
           indexPath = [NSIndexPath indexPathForItem:index-15 inSection:1];
        }
        
      
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
     
        attributes.frame = CGRectIntegral(CGRectMake(xOffset, yOffset, itemSize.width, itemSize.height));
        [_itemAttributes addObject:attributes];
        xOffset = xOffset+itemSize.width+_itemOffset.horizontal;
        column++;
        
        // Create a new row if this was the last column
        if (column == numberOfColumnsInRow)
        {
            if (xOffset > contentWidth)
                contentWidth = xOffset;
            
            // Reset values
            column = 0;
            xOffset = _itemOffset.horizontal;
            yOffset += rowHeight+_itemOffset.vertical;
            
            
        }
    }
    
    UICollectionViewLayoutAttributes *attributes = [_itemAttributes lastObject];
    contentHeight = attributes.frame.origin.y+attributes.frame.size.height;
    
    // Return this in collectionViewContentSize
    _contentSize = CGSizeMake(contentWidth, contentHeight);

    }
    
    


-(CGSize)collectionViewContentSize
{
    return _contentSize;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_itemAttributes objectAtIndex:indexPath.row];
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [_itemAttributes filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(UICollectionViewLayoutAttributes *evaluatedObject, NSDictionary *bindings) {
        return CGRectIntersectsRect(rect, [evaluatedObject frame]);
    }]];
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}


@end
