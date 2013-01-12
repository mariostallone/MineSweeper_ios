//
//  Spot.h
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 07/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MineSpotState.h"

@interface Spot : NSObject

@property(nonatomic,retain) MineSpotState *state;

@end
