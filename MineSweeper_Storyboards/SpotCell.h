//
//  Spot.h
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 06/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Spot.h"

@interface SpotCell : UICollectionViewCell
{
    Spot *spot;
}
@property(nonatomic,assign) IBOutlet UIImageView *frontImage;
@property(nonatomic,assign) IBOutlet UILabel *frontLabel;

@end
