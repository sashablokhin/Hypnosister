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
    
    [self.view addSubview:view];
    
    [view becomeFirstResponder]; // что бы наш вью принимал события
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
