//
//  LogoView.m
//  Hypnosister
//
//  Created by Alexander Blokhin on 30.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "LogoView.h"

@interface LogoView ()

@property (nonatomic, strong) UIImage *logoImage;

@end

@implementation LogoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor darkGrayColor];
        self.logoImage = [UIImage imageNamed:@"globe"];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //CGRect logoRect = CGRectMake(self.bounds.origin.x + 5, self.bounds.origin.y + 5, self.bounds.size.width - 10, self.bounds.size.height - 10);
    //[self.logoImage drawInRect:logoRect];
    
    CGPoint center;
    center.x = self.bounds.origin.x + self.bounds.size.width / 2.0;
    center.y = self.bounds.origin.y + self.bounds.size.height / 2.0;
    
    CGRect logoRect;
    logoRect.size = self.logoImage.size;
    logoRect.origin.x = center.x - logoRect.size.width / 2.0;
    logoRect.origin.y = center.y - logoRect.size.height / 2.0;
    
    [self.logoImage drawInRect:logoRect];

}


@end
