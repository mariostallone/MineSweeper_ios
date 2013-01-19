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
    spots = [[NSMutableArray alloc]init];
    for(int i=0;i<rows;i++)
    {
        NSMutableArray *rowOfSpots = [[NSMutableArray alloc] init];
        for(int j=0;j<cols;j++)
        {
            if(arc4random()%2==0)
            {
                MineSpot *mineSpot = [[MineSpot alloc]init];
                [mineSpot setDelegate:self];
                [rowOfSpots addObject:mineSpot];
                continue;
            }
            [rowOfSpots addObject:[[EmptySpot alloc] init]];
        }
        [spots addObject:rowOfSpots];
    }
    [self fetchAndAddNeighBours];
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
            NSInteger colEndIndex = ((colIndex+1)==cols)?colIndex:colIndex+1;
            NSInteger rowEndIndex = ((rowIndex+1)==rows)?rowIndex:rowIndex+1;
            NSLog(@"SC %d | EC %d| SR %d | ER %d",colStartIndex,colEndIndex,rowStartIndex,rowEndIndex);
            [self addNeighboursWithRowStartIndex:rowStartIndex andRowEndIndex:rowEndIndex andColStartIndex:colStartIndex andColEndIndex:colEndIndex andColIndex:colIndex andRowIndex:rowIndex forSpot:spot];
            NSLog(@"Neighbours : %d",[spot.neighbours count]);
        }
    }
}

-(void)addNeighboursWithRowStartIndex:(NSInteger)rowStartIndex
                        andRowEndIndex:(NSInteger)rowEndIndex
                        andColStartIndex:(NSInteger)colStartIndex
                        andColEndIndex:(NSInteger)colEndIndex
                        andColIndex:(NSInteger)colIndex
                        andRowIndex:(NSInteger)rowIndex
                        forSpot:(Spot*)spot
{
    for(int row=rowStartIndex;row<=rowEndIndex;row++)
    {
        for(int col=colStartIndex;col<=colEndIndex;col++)
        {
            NSLog(@"Adding r: %d, : %d",row,col);
            if(row==rowIndex&&col==colIndex) continue;
            id<SpotNeighbourKnock> _delegate = [[spots objectAtIndex:row] objectAtIndex:col];
            [spot.neighbours addObject:_delegate];
        }
    }
}

-(void)blastMine
{
    for(NSMutableArray *rowOfSpots in spots)
    {
        for(Spot *spot in rowOfSpots)
        {
            [rowOfSpots makeObjectsPerformSelector:@selector(setBlasted)];
        }
    }
}

@end
