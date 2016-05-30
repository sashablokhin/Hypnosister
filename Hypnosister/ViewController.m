//
//  ViewController.m
//  Hypnosister
//
//  Created by Alexander Blokhin on 26.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HypnosisView *view = [[HypnosisView alloc] initWithFrame:self.view.bounds];
    //view.backgroundColor = [UIColor redColor];
    
    //HypnosisView *view2 = [[HypnosisView alloc] initWithFrame:CGRectMake(20, 30, 50, 50)];
    //view2.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:view];
    //[self.view addSubview:view2];
    //[view addSubview:view2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
