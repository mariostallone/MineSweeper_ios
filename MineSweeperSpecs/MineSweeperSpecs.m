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
    context(@"loads", ^{
        it(@"should contain a proper grid", ^{
            [controller loadView];
            [[theValue([controller spotCount]) should] equal:theValue(rows*cols)];
        });
    });
});

SPEC_END