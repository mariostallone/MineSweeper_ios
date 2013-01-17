//
//  MineField.h
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 07/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@interface MineField : NSObject

@property(nonatomic,retain) NSMutableArray *spots;

-(void)initialize;
-(void)blastMine;

@end
