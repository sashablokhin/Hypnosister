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
    
    //HypnosisView *view = [[HypnosisView alloc] initWithFrame:self.view.bounds];
    //[self.view addSubview:view];
    
    CGRect screenRect = self.view.bounds;
    
    // Создание UIScrollView таким образом, чтобы размер окна соответствовал размеру области прокрутки
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [self.view addSubview:scrollView];
    
    // Создание HypnosisView с фреймом, который в два раза больше размера экрана
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;
    
    HypnosisView *view = [[HypnosisView alloc] initWithFrame:bigRect];
    
    [scrollView addSubview:view];
    [scrollView setContentSize:bigRect.size];
    
    [view becomeFirstResponder]; // что бы наш вью принимал события
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
