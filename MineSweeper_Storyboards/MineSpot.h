//
//  MineSpot.h
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 07/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import "Spot.h"
#import "Common.h"

@class MineSpot;

@protocol BlastMineProtocol

-(void)blastMine;

@end

@interface MineSpot : Spot

@property(weak) id<BlastMineProtocol> delegate;

-(void)setBlasted;

@end
