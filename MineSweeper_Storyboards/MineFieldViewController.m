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
    @synchronized(self)
    {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Spot" forIndexPath:indexPath];
    Spot *spot= [[mineField.spots objectAtIndex:indexPath.row] objectAtIndex:indexPath.section];
    SpotCell *spotCell = (SpotCell*)cell;
    if([spot isOpen]&&[spot isKindOfClass:[MineSpot class]])
    {
        [spotCell.frontImage setImage:[_spotImageArray objectAtIndex:mineImage]];
        [spotCell.frontLabel setText:@""];
        [spotCell.frontImage setAlpha:1.0];
        return cell;
    }
    [spotCell.frontImage setImage:[_spotImageArray objectAtIndex:cellImage]];
    if([spot isOpen])
    {
//        [spotCell.frontLabel setText:[(EmptySpot*)spot neighbourMineCount]];
        [spotCell.frontImage setAlpha:0];
    }
    return cell;
    }
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
