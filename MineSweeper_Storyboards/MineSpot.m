//
//  MineSpot.m
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 07/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import "MineSpot.h"

@implementation MineSpot

-(void)open
{
    [super open];
    [self.delegate blastMine];
}

-(void)setBlasted
{
    [super open];
}

@end
