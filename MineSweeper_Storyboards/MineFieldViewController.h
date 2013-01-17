//
//  ViewController.h
//  MineSweeper_Storyboards
//
//  Created by Mario Stallone on 06/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineField.h"

@interface MineFieldViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    MineField *mineField;
    NSArray *_spotImageArray;
}

-(NSInteger)spotCount;

@end
