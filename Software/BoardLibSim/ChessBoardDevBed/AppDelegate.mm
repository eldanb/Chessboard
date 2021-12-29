//
//  AppDelegate.m
//  ChessBoardDevBed
//
//  Created by Eldan Ben Haim on 17/07/2020.
//  Copyright © 2020 Eldan Ben Haim. All rights reserved.
//

#import "AppDelegate.h"
#import "BoardDisplayControl.h"

@interface AppDelegate () <BoardDisplayControlDelegate, NSTableViewDataSource, NSTableViewDelegate> {
    BOOL _inPieceSelect;
    BoardCoordinate _selectedPieceCoord;
    PIECE_COLOR _movingSide;
    BoardConfig _currentBoard;
}

@property (weak) IBOutlet NSTableView *infoTable;

@property (weak) IBOutlet BoardDisplayControl *boardDisplay;

@property (weak) IBOutlet NSWindow *window;
@end


class LightUpLedMoveVisitor: public MoveVisitor {
public:
    LightUpLedMoveVisitor(BoardDisplayControl *boardDisplay,
                          LedState moveStart, LedState moveEnd):
        _boardDisplay(boardDisplay), _moveStartLedState(moveStart), _moveEndLedState(moveEnd),
        _hasMoves(false)
    {
        
    }
    
    bool visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordinate) {
        [_boardDisplay setLedAtCol:startCoordinate.getCol()
                               row:startCoordinate.getRow()
                             state:_moveStartLedState];

        [_boardDisplay setLedAtCol:endCoordinate.getCol()
                               row:endCoordinate.getRow()
                             state:_moveEndLedState];
        _hasMoves = true;
        
        return true;
    }
    
private:
    BoardDisplayControl *_boardDisplay;
    bool _hasMoves;
    LedState _moveStartLedState, _moveEndLedState;
};



@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _currentBoard.loadForNewGame();
    _movingSide = PIECE_COLOR_WHITE;
    _inPieceSelect = true;
    
    [self updateDisplayForUserInput];
}

-(void) updateDisplayForUserInput {
    [self.boardDisplay clearLeds];
    self.boardDisplay.board = _currentBoard;

    if(_inPieceSelect) {
        LightUpLedMoveVisitor v(_boardDisplay, LedStateGreen, LedStateOff);
        _currentBoard.visitMovablePieces(_movingSide, v);
    } else {
        LightUpLedMoveVisitor v(_boardDisplay, LedStateOff, LedStateGreen);
        _currentBoard.visitMovesForPieceAt(_selectedPieceCoord, v);
    }
    
    [self.infoTable reloadData];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(void)boardDisplayControl:(BoardDisplayControl *)sender clickedOnRow:(int)row col:(int)col {
    if(_inPieceSelect) {
        _selectedPieceCoord = BoardCoordinate(col, row);
        if(_currentBoard.getPieceAt(_selectedPieceCoord).isPieceInColor(_movingSide)) {
            _inPieceSelect = false;
        }
    } else {
        BoardCoordinate moveTarget(col, row);
        FindTargetVisitor v(moveTarget);
        _currentBoard.visitMovesForPieceAt(_selectedPieceCoord, v);
        if(v.found()) {
            _currentBoard.applyMove(_selectedPieceCoord, moveTarget);
            _movingSide = !_movingSide;
        }
        
        _inPieceSelect = true;
    }
    
    [self updateDisplayForUserInput];
}

- (IBAction)resetGame:(id)sender {
    _currentBoard.loadForNewGame();
    _movingSide = PIECE_COLOR_WHITE;
    _inPieceSelect = true;
    
    [self updateDisplayForUserInput];
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 5;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *label;
    if([tableColumn.identifier isEqualToString:@"label"]) {
        label = (@[ @"Rook A Moved", @"Rook H Moved", @"King Moved", @"Pieces Captured", @"Play Time"])[row];
    } else {
        PlayerState plState = [tableColumn.identifier isEqualToString:@"white"] ? _currentBoard.getPlayerState(PIECE_COLOR_WHITE) : _currentBoard.getPlayerState(PIECE_COLOR_BLACK);
        
        switch(row) {
            case 0:
            case 1:
            case 2:
                label = plState._flags & (1 << row) ? @"Yes" : @"No";
                break;

            case 3:
                label = [NSString stringWithFormat:@"%d", plState._score];
                break;

            case 4:
                label = [NSString stringWithFormat:@"%d", plState._gameTime];
                break;
        }
    }
    
    NSTableCellView *cv = [tableView makeViewWithIdentifier:@"col1Cell" owner:self];
    cv.textField.stringValue = label;
    return cv;
}

@end
