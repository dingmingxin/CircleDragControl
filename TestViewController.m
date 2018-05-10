//
//  TestViewController.m
//  CircleDragControl
//
//  Created by dmx on 2018/5/10.
//  Copyright © 2018 dmx. All rights reserved.
//

#import "TestViewController.h"
#import "CircleDragView.h"

@interface TestViewController ()

@end

@implementation TestViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    CGSize size = self.view.bounds.size;
    CGFloat rectWith = 100;
    CGRect frame = NSMakeRect(size.width/2-rectWith/2, size.height/2-rectWith/2, rectWith, rectWith);
//    CircleDragView *circleView = [[CircleDragView alloc] initWithFrame:frame lineWidth:4 color:[NSColor greenColor]];
    CircleDragView *circleView = [[CircleDragView alloc] initWithFrame:frame lineWidth:10 color:NULL];
    [self.view addSubview:circleView];
    
//    self.view.wantsLayer = YES;
//    self.view.layer.backgroundColor = [[NSColor greenColor] CGColor];
}

@end
