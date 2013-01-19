//
//  EmptySpot.m
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 07/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import "EmptySpot.h"

@implementation EmptySpot

-(void)open
{
    [super open];
}

-(NSString*)neighbourMineCount
{
    NSInteger mineCount = [self.neighbours countOfObjectsOfType:[MineSpot class]];
    if(mineCount==0)
    {
        return @"";
    }
    return [NSString stringWithFormat:@"%d",mineCount];
}

@end
