//
//  ViewController.m
//  Hypnosister
//
//  Created by Alexander Blokhin on 26.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "ViewController.h"
#import "HypnosisView.h"
#import "LogoView.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) HypnosisView *hypnosisView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //HypnosisView *view = [[HypnosisView alloc] initWithFrame:self.view.bounds];
    //[self.view addSubview:view];
    
    CGRect screenRect = self.view.bounds;
    
    // Создание UIScrollView таким образом, чтобы размер окна соответствовал размеру области прокрутки
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    //[scrollView setPagingEnabled:true];
    
    
    // Масштабирование
    
    [scrollView setMinimumZoomScale:1.0];
    [scrollView setMaximumZoomScale:5.0];
    
    scrollView.delegate = self;
    
    // -----
    
    [self.view addSubview:scrollView];
    
    // Создание HypnosisView с фреймом, который в два раза больше размера экрана
    CGRect bigRect = screenRect;
    
    //bigRect.size.width *= 2.0;
    
    self.hypnosisView = [[HypnosisView alloc] initWithFrame:screenRect];
    [scrollView addSubview:self.hypnosisView];
    
    // Перемещение прямоугольника для другого HypnosisView, находящегося справа, за границей экрана
    //screenRect.origin.x = screenRect.size.width;
    //HypnosisView *anotherView = [[HypnosisView alloc] initWithFrame:screenRect];
    //[scrollView addSubview:anotherView];
    
    [scrollView setContentSize:bigRect.size];
    
    [self.hypnosisView becomeFirstResponder]; // что бы наш вью принимал события
    
    LogoView *logo = [[LogoView alloc] initWithFrame:CGRectMake(30, 30, 100, 100)];
    
    [self.hypnosisView addSubview:logo];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return true;
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.hypnosisView;
}

@end







