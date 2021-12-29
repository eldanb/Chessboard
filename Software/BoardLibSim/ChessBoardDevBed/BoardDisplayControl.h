//
//  BoardDisplayControl.h
//  ChessBoardDevBed
//
//  Created by Eldan Ben Haim on 17/07/2020.
//  Copyright © 2020 Eldan Ben Haim. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Board.h"

NS_ASSUME_NONNULL_BEGIN

enum LedState {
    LedStateOff,
    LedStateRed,
    LedStateGreen,
    LedStateBlink
};

@class BoardDisplayControl;

@protocol BoardDisplayControlDelegate
-(void)boardDisplayControl:(BoardDisplayControl*)sender clickedOnRow:(int)row col:(int)col;
@end

@interface BoardDisplayControl : NSView

@property BoardConfig board;
@property (weak) IBOutlet id<BoardDisplayControlDelegate> delegate;

-(void)setLedAtCol:(int)col row:(int)row state:(LedState)ledState;
-(void)clearLeds;

@end

NS_ASSUME_NONNULL_END
