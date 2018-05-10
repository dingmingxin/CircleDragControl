//
//  CircleDragView.m
//  CircleDragControl
//
//  Created by dmx on 2018/5/10.
//  Copyright © 2018 dmx. All rights reserved.
//

#import "CircleDragView.h"
#import <CoreGraphics/CoreGraphics.h>



@interface CircleDragView () {
    @private
    CGFloat minWidth;
}
@property (strong) NSColor *lineColor;
@property (strong) NSColor *defaultColor;
@property (strong) NSBezierPath *bezierPath;
@property (assign) BOOL canDragToResize;
@property (assign) CGFloat lineWidth;
@end

@implementation CircleDragView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self drawCircle];
}

- (instancetype)initWithFrame:(NSRect)frame lineWidth:(CGFloat)width color:(nullable NSColor *)lineColor {
    self = [self initWithFrame:frame];
    if (self) {
        self.lineColor = lineColor;
    }
    self.lineWidth = width;
    minWidth = 80.0f;
    if (self.defaultColor == NULL) {
        CGFloat r,g,b,a;
        [[NSColor redColor] getRed:&r green:&g blue:&b alpha:&a];
        self.defaultColor = [NSColor colorWithRed:r green:g blue:b alpha:0.5];
        self.canDragToResize = FALSE;
    }
    return self;
}

- (void)drawCircle {
    NSColor *strokeColor = self.defaultColor;
    if (self.lineColor != NULL) {
        strokeColor = self.lineColor;
    }
    [strokeColor setStroke];
    
    CGSize size = self.bounds.size;
    CGFloat min = MIN(size.width, size.height);
    CGFloat radius = min/2-self.lineWidth/2;
    NSBezierPath* bezierPath = [NSBezierPath bezierPath];
    
    NSPoint center = NSMakePoint(size.width/2, size.height/2);
    [bezierPath appendBezierPathWithArcWithCenter:center radius:radius startAngle:0 endAngle:360 clockwise:NO];
    bezierPath.lineWidth = self.lineWidth;
    [bezierPath closePath];
    [bezierPath stroke];
    
    self.bezierPath = bezierPath;
}

- (void)mouseDragged:(NSEvent *)event {
    CGFloat deltaX = event.deltaX;
    CGFloat deltaY = event.deltaY;
    if (deltaX != 0 || deltaY != 0) {
        NSRect originBounds = self.bounds;
        NSRect originFrame = self.frame;
        if (!self.canDragToResize) {
            return;
        }
        CGFloat min = MIN(originFrame.size.width, originFrame.size.height);

        NSPoint locationInView = [self convertPoint:[event locationInWindow] fromView:nil];
        NSPoint center = NSMakePoint(originFrame.size.width/2, originFrame.size.height/2);
        CGFloat xDist = locationInView.x - center.x;
        CGFloat yDist = locationInView.y - center.y;
        NSLog(@"move, location: %f %f", locationInView.x, locationInView.y);
        NSLog(@"xDist: %f yDist: %f", xDist, yDist);
        CGFloat distance = sqrt(xDist*xDist + yDist*yDist);
        
        
        CGFloat width = distance*2;
        CGFloat newWidth = width;
        CGFloat newHeight = width;
        
        if (width < min  && min <= minWidth) {
            return;
        }

        CGFloat delta = width-originBounds.size.width;
        if (newWidth > 0 && newHeight > 0) {
            self.frame = NSMakeRect(originFrame.origin.x-delta/2, originFrame.origin.y-delta/2, newWidth, newHeight);
            [self needsDisplay];
        }
    }
}

- (void)mouseDown:(NSEvent *)event {
    NSRect originFrame = self.frame;
    NSPoint center = NSMakePoint(originFrame.size.width/2, originFrame.size.height/2);
    CGFloat min = MIN(originFrame.size.width, originFrame.size.height);
    NSPoint locationInView = [self convertPoint:[event locationInWindow] fromView:nil];
    CGFloat xDist = locationInView.x - center.x;
    CGFloat yDist = locationInView.y - center.y;
    CGFloat distance = sqrt(xDist*xDist + yDist*yDist);
    if (distance < min/2-self.lineWidth || distance > min/2) {
        self.canDragToResize = FALSE;
    }
    else {
        self.canDragToResize = TRUE;
    }
}

- (void)mouseUp:(NSEvent *)event {
    self.canDragToResize = FALSE;
}

@end