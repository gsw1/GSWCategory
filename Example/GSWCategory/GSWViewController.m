//
//  GSWViewController.m
//  GSWCategory
//
//  Created by gsw1 on 02/16/2020.
//  Copyright (c) 2020 gsw1. All rights reserved.
//

#import "GSWViewController.h"
#import <GSWCategory/UIView+corner.h>

@interface GSWViewController ()

@end

@implementation GSWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(10, 98, 100, 100)];
    [redView addCornerWithRadius:8 corners:UIRectCornerTopLeft backgroundColor:[UIColor redColor] borderColor:[UIColor greenColor] borderWidth:2];
    [self.view addSubview:redView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
