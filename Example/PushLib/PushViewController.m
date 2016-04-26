//
//  PushViewController.m
//  PushLib
//
//  Created by samuel.ferreira on 04/18/2016.
//  Copyright (c) 2016 samuel.ferreira. All rights reserved.
//

#import "PushViewController.h"
#import "PushLib/PushManager.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [PushManager subscribeDevice];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end