//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Alexander Blokhin on 26.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // Контекст рисования поддерживает состояние рисунка (например, текущий цвет рисунка и толщину пера)
    // и выполняет операции по рисованию. Контекст рисования создается автоматически в качестве "текущего контекста"
    CGContextRef context = UIGraphicsGetCurrentContext(); // Суффикс Ref обеспечивает распознавание указателей на структуры C и указателей на объекты Objective-C.
    CGRect bounds = [self bounds];
    
    // Определение центра в области прямоугольника bounds
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // Радиус окружности примерно соответствует размеру представления
    // hypot - возвращает гипотенузу
    //float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    CGContextSetLineWidth(context, 10); // толщина линии
    //CGContextSetRGBStrokeColor(context, 0.6, 0.6, 0.6, 1.0); // цвет линии
    [[self circleColor] setStroke];
    
    // Добавление фигуры к контексту - не выполняется рисование фигуры
    //CGContextAddArc(context, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, true);
    
    // Рисование концентрических окружностей от центра
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        // Добавление контура в контекст
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, true);
        
        // Выполнение инструкций по рисованию; рисование текущей фигуры с данным состоянием
        CGContextStrokePath(context);
    }
    
    // Создание строки
    NSString *text = @"You are getting sleepy.";
    
    // Получение шрифта для его рисования
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    NSDictionary *attributes = @{NSFontAttributeName: font};
    
    // Насколько велика строка при рисовании этим шрифтом?
    textRect.size = [text sizeWithAttributes:attributes];
    
    // Поместим строку в центр представления
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor] setFill];
    
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    
    // Установка тени контекста, все последующие рисунки будут с эффектом тени
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    // Рисование строки
    [text drawInRect:textRect withAttributes:attributes];
    
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay]; // для перерисовки контекста
}

- (BOOL)canBecomeFirstResponder {
    return true;
}

// Отправка первому респондеру сообщения в случае сотрясения пользователем устройства
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Device started shaking!");
        [self setCircleColor:[UIColor redColor]];
    }
    
}

@end









