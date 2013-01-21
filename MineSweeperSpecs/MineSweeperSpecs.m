//
//  MineSweeperSpecs
//
//  Created by Mario Stallone on 06/01/13.
//  Copyright (c) 2013 Mario Stallone. All rights reserved.
//

#import "Kiwi.h"
#import "MineFieldViewController.h"
#import "Common.h"

SPEC_BEGIN(MineFieldViewControllerSpecs)

describe(@"MineFieldViewController", ^{
    
    __block MineFieldViewController *controller;
    beforeAll(^{
        UIStoryboard *mainStoryboard =[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
        controller = [mainStoryboard instantiateViewControllerWithIdentifier:@"MineFieldViewController"];
        [controller viewDidLoad];
    });
    context(@"when it loads", ^{
        it(@"should contain a properly formed grid", ^{
            [controller loadView];
            [[theValue([controller numberOfSectionsInCollectionView:controller.collectionView]) should] equal:theValue(sections)];
            for(NSInteger i =0;i<sections;i++)
            {
                [[theValue([controller collectionView:controller.collectionView numberOfItemsInSection:i])
                 should] equal:theValue(rows)];
            }
        });
    });
});

SPEC_END