//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Alexander Blokhin on 26.05.16.
//  Copyright © 2016 Alexander Blokhin. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView


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
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 4.0;
    
    CGContextSetLineWidth(context, 10); // толщина линии
    CGContextSetRGBStrokeColor(context, 0.6, 0.6, 0.6, 1.0); // цвет линии
    
    // Добавление фигуры к контексту - не выполняется рисование фигуры
    CGContextAddArc(context, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, true);
    
    // Выполнение инструкций по рисованию; рисование текущей фигуры с данным состоянием
    CGContextStrokePath(context);
    
}


@end
