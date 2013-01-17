//
//  Spot.h
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 07/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Spot;

@protocol SpotNeighbourKnock <NSObject>

-(void)openNeighbour;
-(BOOL)isMine;

@end

@interface Spot : NSObject<SpotNeighbourKnock>

@property(nonatomic,retain) NSMutableArray *neighbours;

@end
