//
//  TestViewController.m
//  CircleDragControl
//
//  Created by dmx on 2018/5/10.
//  Copyright © 2018 dmx. All rights reserved.
//

#import "TestViewController.h"
#import "CircleDragView.h"
#import "BFColorPickerPopover.h"
@interface TestViewController ()
@property (strong) CircleDragView *circle;
@end

@implementation TestViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    CGSize size = self.view.bounds.size;
    CGFloat rectWith = 100;
    CGRect frame = NSMakeRect(size.width/2-rectWith/2, size.height/2-rectWith/2, rectWith, rectWith);
    
    CircleDragView *circleView = [[CircleDragView alloc] initWithFrame:frame lineWidth:10 color:NULL];
    circleView.delegate = self;
    self.circle = circleView;
    [self.view addSubview:circleView];
}

- (void)targetDotClicked {
    NSRect frame = self.circle.frame;
    CGPoint origin = frame.origin;
    CGSize size = frame.size;
    NSRect f = NSMakeRect(origin.x+size.width/2, origin.y+size.height/2, 2, 2);
    
    [[BFColorPickerPopover sharedPopover] showRelativeToRect:f ofView:self.view preferredEdge:NSMaxXEdge];
}

@end
