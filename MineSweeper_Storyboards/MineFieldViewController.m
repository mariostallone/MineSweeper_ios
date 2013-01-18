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
    mineField = [[MineField alloc] init];
    [mineField initialize];
    _spotImageArray = @[[UIImage imageNamed:@"cell.jpg"],[UIImage imageNamed:@"mine.png"]];
}

-(NSInteger)spotCount
{
    return [mineField.spots count];
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
    Spot *spot= [[mineField.spots objectAtIndex:indexPath.row] objectAtIndex:indexPath.section];
    UICollectionViewCell *cell = nil;
    if(![spot isOpen])
    {
        cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Spot" forIndexPath:indexPath];
        return cell;
    }
    if([spot isKindOfClass:[MineSpot class]])
    {
        cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Mine" forIndexPath:indexPath];
        return cell;
    }
    cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Spot" forIndexPath:indexPath];
    SpotCell *spotCell = (SpotCell*)cell;
    [spotCell.frontLabel setText:[(EmptySpot*)spot neighbourMineCount]];
    [spotCell.frontImage setAlpha:0.5];
    return spotCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Spot *spot= [[mineField.spots objectAtIndex:indexPath.row] objectAtIndex:indexPath.section];
    [spot open];
    SpotCell *spotCell = (SpotCell*)[collectionView cellForItemAtIndexPath:indexPath];
    if ([spot isKindOfClass:[MineSpot class]])
    {
        [spotCell.frontImage setImage:[_spotImageArray objectAtIndex:mineImage]];
        [collectionView reloadData];
        [collectionView setUserInteractionEnabled:YES];
        return;
    }
    [spotCell.frontLabel setText:[(EmptySpot*)spot neighbourMineCount]];
    [spotCell.frontImage setAlpha:0.5];
}

@end
