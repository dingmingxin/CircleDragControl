//
//  CircleDragView.h
//  CircleDragControl
//
//  Created by dmx on 2018/5/10.
//  Copyright © 2018 dmx. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol CircleDragControlDelegate
@optional
- (void)targetDotClicked;
@end

@interface CircleDragView : NSView

@property (assign) id<CircleDragControlDelegate> delegate;
- (instancetype)initWithFrame:(NSRect)frame lineWidth:(CGFloat)width color:(NSColor *)lineColor;
@end




