//
//  ViewController.m
//  ORBSwitchDemo
//
//  Created by Vladislav Averin on 28/11/2016.
//  Copyright © 2016 Vlad Averin (hello@vladaverin.me). All rights reserved.
//

#import "ViewController.h"
#import "ORBSwitch.h"

@interface ViewController () <ORBSwitchDelegate> {
    ORBSwitch *_switch1;
    ORBSwitch *_switch2;
    ORBSwitch *_switch3;
    ORBSwitch *_switch4;
}

@end

@implementation ViewController

#pragma View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    _switch1 = [[ORBSwitch alloc] initWithType:ORBSwitchSquare frame:CGRectMake(0,
                                                                                0,
                                                                                100,
                                                                                60)];
    _switch1.knobColor = [UIColor orangeColor];
    _switch1.inactiveBackgroundColor = [UIColor lightGrayColor];
    _switch1.activeBackgroundColor = [UIColor darkGrayColor];
    
    _switch1.center = CGPointMake(self.view.bounds.size.width / 2,
                                  self.view.bounds.size.height * 0.30f);
    
    
    _switch2 = [[ORBSwitch alloc] initWithType:ORBSwitchRound frame:CGRectMake(0,
                                                                                0,
                                                                                120,
                                                                                72)];
    _switch2.knobColor = [UIColor whiteColor];
    _switch2.inactiveBackgroundColor = [UIColor redColor];
    _switch2.activeBackgroundColor = [UIColor greenColor];
    _switch2.knobRelativeHeight = 0.8f;
    
    _switch2.center = CGPointMake(self.view.bounds.size.width / 2,
                                  _switch1.center.y + _switch2.frame.size.height + 20);
    
    
    _switch3 = [[ORBSwitch alloc] initWithCustomKnobImage:[UIImage imageNamed:@"sw_knob"] inactiveBackgroundImage:[UIImage imageNamed:@"sw_bg.jpg"] activeBackgroundImage:[UIImage imageNamed:@"sw_bg_on.jpg"] frame:CGRectMake(0, 0, 160, 96)];
    _switch3.center = CGPointMake(self.view.bounds.size.width / 2,
                                  _switch2.center.y + _switch3.frame.size.height + 20);
    _switch3.knobRelativeHeight = 0.8f;
    
    
    _switch4 = [[ORBSwitch alloc] initWithCustomKnobImage:[UIImage imageNamed:@"mario_r"] inactiveBackgroundImage:[UIImage imageNamed:@"mario_bg"] activeBackgroundImage:[UIImage imageNamed:@"mario_bg"] frame:CGRectMake(0, 0, 200, 120)];
    _switch4.center = CGPointMake(self.view.bounds.size.width / 2,
                                  _switch3.center.y + _switch4.frame.size.height + 20);
    _switch4.knobRelativeHeight = 0.8f;
    
    _switch1.delegate = _switch2.delegate = _switch3.delegate = _switch4.delegate = self;
    
    [self.view addSubview:_switch1];
    [self.view addSubview:_switch2];
    [self.view addSubview:_switch3];
    [self.view addSubview:_switch4];
}

#pragma mark - ORBSwitchDelegate

- (void)orbSwitchToggled:(ORBSwitch *)switchObj withNewValue:(BOOL)newValue {
    NSLog(@"Switch toggled: new state is %@", (newValue) ? @"ON" : @"OFF");
}

- (void)orbSwitchToggleAnimationFinished:(ORBSwitch *)switchObj {
    if (switchObj == _switch4) {
        [switchObj setCustomKnobImage:[UIImage imageNamed:(switchObj.isOn) ? @"mario_l" : @"mario_r"]
              inactiveBackgroundImage:[UIImage imageNamed:@"mario_bg"]
                activeBackgroundImage:[UIImage imageNamed:@"mario_bg"]];
    }
}

@end
