//
//  MineField.m
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 07/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import "MineField.h"

@implementation MineField

@synthesize spots;

-(void)initialize
{
    BOOL mineCheck=NO;
    while (!mineCheck)
    {
        spots = [[NSMutableArray alloc]init];
        for(int i=0;i<rows;i++)
        {
            NSMutableArray *rowOfSpots = [[NSMutableArray alloc] init];
            for(int j=0;j<sections;j++)
            {
                if(arc4random()%2==0)
                {
                    MineSpot *mineSpot = [[MineSpot alloc]init];
                    [mineSpot setDelegate:self];
                    [rowOfSpots addObject:mineSpot];
                    mineCheck=YES;
                    continue;
                }
                [rowOfSpots addObject:[[EmptySpot alloc] init]];
            }
            [spots addObject:rowOfSpots];
        }
        [self fetchAndAddNeighBours];
    }
}

-(void)fetchAndAddNeighBours
{
    for(NSMutableArray *rowOfSpots in spots)
    {
        NSInteger rowIndex = [spots indexOfObject:rowOfSpots];
        for(Spot *spot in rowOfSpots)
        {
            NSInteger colIndex = [rowOfSpots indexOfObject:spot];          
            NSLog(@"R %d | C %d",rowIndex,colIndex);
            NSInteger colStartIndex = ((colIndex-1)<=0)?0:colIndex-1;
            NSInteger rowStartIndex = ((rowIndex-1)<=0)?0:rowIndex-1;
            NSInteger colEndIndex = ((colIndex+1)==sections)?colIndex:colIndex+1;
            NSInteger rowEndIndex = ((rowIndex+1)==rows)?rowIndex:rowIndex+1;
            NSDictionary *indices =
            @{
                @"colStartIndex":@(colStartIndex),
                @"colEndIndex":@(colEndIndex),
                @"rowStartIndex":@(rowStartIndex),
                @"rowEndIndex":@(rowEndIndex),
                @"colIndex":@(colIndex),
                @"rowIndex":@(rowIndex)
            };
            NSLog(@"SC %d | EC %d| SR %d | ER %d",colStartIndex,colEndIndex,rowStartIndex,rowEndIndex);
            [self addNeighboursWithIndices:indices forSpot:spot];
            NSLog(@"Neighbours : %d",[spot.neighbours count]);
        }
    }
}

-(void)addNeighboursWithIndices:(NSDictionary*)indices forSpot:(Spot*)spot
{
    for(int row=[[indices valueForKey:@"rowStartIndex"] integerValue];
        row<=[[indices valueForKey:@"rowEndIndex"] integerValue];row++)
    {
        for(int col=[[indices valueForKey:@"colStartIndex"] integerValue];
            col<=[[indices valueForKey:@"colEndIndex"] integerValue];col++)
        {
            NSLog(@"Adding r: %d, : %d",row,col);
            if(row==[[indices valueForKey:@"rowIndex"] integerValue]&&
               col==[[indices valueForKey:@"colIndex"] integerValue]) continue;
            id<SpotNeighbourKnock> _delegate = [[spots objectAtIndex:row] objectAtIndex:col];
            [spot.neighbours addObject:_delegate];
        }
    }
}

-(void)blastMine
{
    for(NSMutableArray *rowOfSpots in spots)
    {
        [rowOfSpots makeObjectsPerformSelector:@selector(setBlasted)];
    }
}

@end
