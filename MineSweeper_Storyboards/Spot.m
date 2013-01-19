//
//  Spot.m
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 07/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import "Spot.h"

@implementation Spot

-(id)init
{
    self=[super init];
    if(self)
    {
        self.neighbours = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString*)neighbourCount
{
    return [NSString stringWithFormat:@"%d",[self.neighbours count]];
}

-(BOOL)isOpen
{
    return _open;
}

-(BOOL)isNotOpen
{
    return !_open;
}

-(void)open
{
    _open=YES;
}

-(void)setBlasted
{
    
}

-(void)openNeighbour
{
    
}

@end
