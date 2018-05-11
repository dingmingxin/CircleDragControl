//
//  CircleCollectionView.m
//  CircleDragControl
//
//  Created by dmx on 2018/5/11.
//  Copyright © 2018 dmx. All rights reserved.
//

#import "CircleCollectionView.h"
#import "CircleDragView.h"

@interface CircleCollectionView ()

@property (strong) NSMutableArray<CircleDragView *> *circles;

@end



@implementation CircleCollectionView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.circles = [[NSMutableArray alloc] initWithCapacity:2];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
}

@end
