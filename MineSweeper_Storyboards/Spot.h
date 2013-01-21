//
//  Spot.h
//  MineSweeper_Storyboards
//  This class has to subclassed EmptySpot and MineSpot.
//  It is not intended to be instanitated
//
//  Created by Mario Stallone on 07/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Spot;

@protocol SpotNeighbourKnock <NSObject>

-(void)openNeighbour;

@end

@interface Spot : NSObject<SpotNeighbourKnock>
{
    BOOL _open;
}
@property(nonatomic,retain) NSMutableArray *neighbours;

-(NSString*)neighbourCount;
-(BOOL)isOpen;
-(BOOL)isNotOpen;
-(void)open;
-(void)setBlasted;

@end
