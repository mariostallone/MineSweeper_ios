//
//  ViewController.m
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 06/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import "MineFieldViewController.h"
#import "MineSpot.h"
#import "EmptySpot.h"
#import "SpotCell.h"

enum spotImageEnum {
    cellImage = 0,
    mineImage = 1
    }SpotImageEnum;

@interface MineFieldViewController ()

@end

@implementation MineFieldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initialize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initialize
{
    _mineField = [[MineField alloc] init];
    [_mineField initialize];
    _spotImageArray = @[[UIImage imageNamed:@"cell.jpg"],[UIImage imageNamed:@"mine.png"]];
}

-(NSInteger)spotCount
{
    return [_mineField.spots count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return rows;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return cols;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Spot *spot= [[_mineField.spots objectAtIndex:indexPath.row] objectAtIndex:indexPath.section];
    SpotCell *cell = nil;
    if([spot isKindOfClass:[MineSpot class]])
    {
        if([spot isNotOpen])
        {
            return [collectionView dequeueReusableCellWithReuseIdentifier:@"ClosedSpot" forIndexPath:indexPath];
        }
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"Mine" forIndexPath:indexPath];
    }
    if([spot isNotOpen])
    {
        return [collectionView dequeueReusableCellWithReuseIdentifier:@"ClosedSpot" forIndexPath:indexPath];
    }
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"OpenSpot" forIndexPath:indexPath];
    [cell.frontLabel setText:[(EmptySpot*)spot neighbourMineCount]];
    [cell.frontImage setAlpha:0.5];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Spot *spot= [[_mineField.spots objectAtIndex:indexPath.row] objectAtIndex:indexPath.section];
    [spot open];
    if ([spot isKindOfClass:[MineSpot class]])
    {
        [collectionView setUserInteractionEnabled:YES];
    }
    [collectionView reloadData];
}

@end
