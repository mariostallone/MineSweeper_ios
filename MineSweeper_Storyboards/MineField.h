//
//  MineField.h
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 07/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MineSpot.h"

@interface MineField : NSObject<BlastMineProtocol>

@property(nonatomic,retain) NSMutableArray *spots;

-(void)initialize;

@end
