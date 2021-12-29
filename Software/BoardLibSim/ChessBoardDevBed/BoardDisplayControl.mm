//
//  BoardDisplayControl.m
//  ChessBoardDevBed
//
//  Created by Eldan Ben Haim on 17/07/2020.
//  Copyright © 2020 Eldan Ben Haim. All rights reserved.
//

#import "BoardDisplayControl.h"

@interface BoardDisplayControl () {
    NSImage *_chessPiecesImage;
    
    BoardConfig _board;
    LedState _ledState[8][8];
}

@end


@implementation BoardDisplayControl

-(BoardConfig) board {
    return _board;
}

-(void) setBoard:(BoardConfig)board {
    _board = board;
    [self setNeedsDisplay:YES];
}

-(void)drawImageForChessPiece:(BoardPiece)piece centerAtPoint:(CGPoint)point {
    if(!_chessPiecesImage) {
        _chessPiecesImage = [NSImage imageNamed:@"ChessPieces.png"];
    }
    
    int col = 6 - piece.getPieceType();
    if(col>5) {
        return;
    }

    if(piece.getPieceColor() == PIECE_COLOR_WHITE) {
        col += 6;
    }
    
    int pieceWidth = _chessPiecesImage.size.width / 12;
    int pieceHeight = _chessPiecesImage.size.height;
    
    NSRect pieceRect = NSMakeRect(col*pieceWidth, 0, pieceWidth, pieceHeight);
    
    point.x = point.x - pieceWidth / 2;
    point.y = point.y - pieceHeight / 2;
    
    [_chessPiecesImage drawAtPoint:point fromRect:pieceRect operation:NSCompositingOperationSourceOver fraction:1];
}


- (void)setLedAtCol:(int)col row:(int)row state:(LedState)ledState {
    _ledState[col][row] = ledState;
    [self setNeedsDisplay:YES];
}

-(void)clearLeds {
    for(int c=0; c<8; c++) {
        for(int r=0; r<8; r++) {
            _ledState[c][r] = LedStateOff;
        }
    }
    
    [self setNeedsDisplay:YES];
}

- (void)drawLedState:(LedState)ledState centerAtPoint:(NSPoint)centerPoint {
    switch(ledState) {
        case LedStateOff:
            return;

        case LedStateGreen:
            [[NSColor greenColor] setFill];
            break;
            
        case LedStateRed:
            [[NSColor redColor] setFill];
            break;
            
        case LedStateBlink:
            [[NSColor orangeColor] setFill];
            break;
    }
        
    NSRect ledRect = NSMakeRect(centerPoint.x - 4, centerPoint.y - 4, 8, 8);
    [[NSBezierPath bezierPathWithOvalInRect:ledRect] fill];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    CGSize scheduleSize = self.scheduleSize;

    for(int r=0; r<8; r++) {
        for(int c=0; c<8; c++) {
            NSRect scheduleRect = NSMakeRect(c * scheduleSize.width, r * scheduleSize.height,
                                             scheduleSize.width, scheduleSize.height);
            
            NSColor *schedColor = ((r+c)%2) ? [NSColor whiteColor] : [NSColor blackColor];
            [schedColor setFill];
            [NSBezierPath fillRect:scheduleRect];
            
            [self drawImageForChessPiece:self.board.getPieceAt(BoardCoordinate(c, r))
                           centerAtPoint:NSMakePoint(NSMidX(scheduleRect), NSMidY(scheduleRect))];
            
            
            [self drawLedState:_ledState[c][r] centerAtPoint:NSMakePoint(scheduleRect.origin.x + 5, scheduleRect.origin.y + scheduleSize.height - 5)];
            
        }
    }
    
    [[NSColor grayColor] setStroke];
    [NSBezierPath strokeRect:self.bounds];
}

- (void)mouseDown:(NSEvent *)event {
    if(self.delegate) {
        NSPoint event_location = event.locationInWindow;
        NSPoint local_point = [self convertPoint:event_location fromView:nil];

        CGSize scheduleSize = self.scheduleSize;

        int row = local_point.y / scheduleSize.height;
        int col = local_point.x / scheduleSize.width;
        
        if(row >= 0 && row <= 7 && col >= 0 && col <= 7) {
            [self.delegate boardDisplayControl:self clickedOnRow:row col:col];
        }
        
    }
}


-(CGSize)scheduleSize {
    CGRect bounds = self.bounds;
    CGSize scheduleSize = { bounds.size.width/8, bounds.size.height/8 };
    
    return scheduleSize;
}

@end
