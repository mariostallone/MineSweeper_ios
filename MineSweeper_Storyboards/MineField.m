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
    for(int i=0;i<cols;i++)
    {
        for(int j=0;j<rows;j++)
        {
            Spot *spot = [[Spot alloc] init];
            [spots addObject:spot];
            if(arc4random()%2==0)
            {
                [spot setState:[[MineSpot alloc] init]];
                continue;
            }
            [spot setState:[[EmptySpot alloc] init]];
        }
    }
}

@end
