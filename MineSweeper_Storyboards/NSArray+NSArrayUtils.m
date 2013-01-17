//
//  NSObject+NSArrayUtils.m
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 18/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import "NSArray+NSArrayUtils.h"

@implementation NSArray (NSArrayUtils)

-(NSInteger)countOfObjectsOfType:(Class)type
{
    NSInteger count = 0;
    for(id obj in self)
    {
        if([obj isKindOfClass:type])
        {
            count++;
        }
    }
    return count;
}

@end
