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
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Spot" forIndexPath:indexPath];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Spot *spot= [mineField.spots objectAtIndex:indexPath.section*indexPath.row];
    SpotCell *spotCell = (SpotCell*)[collectionView cellForItemAtIndexPath:indexPath];
    if ([spot isKindOfClass:[MineSpot class]])
    {
        [spotCell.frontImage setImage:[UIImage imageNamed:@"mine.png"]];
        return;
    }
    [spotCell.frontLabel setText:@"4"];
    [spotCell.frontImage setAlpha:0.5];
}

@end
