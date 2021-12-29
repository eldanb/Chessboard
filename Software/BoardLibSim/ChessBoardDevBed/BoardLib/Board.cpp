#include "Board.h"

#ifndef __AVR_ARCH__
#include <memory.h>
#endif

bool BoardCoordinate::loadWithOffset(int cOfs, int rOfs, BoardCoordinate &dest) const {
    int row = getRow() + rOfs;
    int col = getCol() + cOfs;
    
    if(row >= 0 && row < 8 && col >=0 && col < 8) {
        dest = BoardCoordinate(col, row);
        return true;
    } else {
        return false;
    }
}


class SingleMovePerPieceVisitor: public MoveVisitor {
public:
    SingleMovePerPieceVisitor(MoveVisitor &underlying): _underlying(underlying) {
        
    }
    
    bool visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordiante) {
        _underlying.visitPieceMove(startCoordinate, endCoordiante);
        return false;
    }

private:
    MoveVisitor &_underlying;
};

FindCheckCondition::FindCheckCondition(const BoardConfig &boardConfig,
                                       PIECE_COLOR protectedPieceColor):
        _protectedPieceColor(protectedPieceColor), _startBoard(boardConfig), _checkFound(false) {
        
}
    
bool FindCheckCondition::visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordiante) {
    BoardPiece capturedPiece = _startBoard.getPieceAt(endCoordiante);
    if(capturedPiece.getPieceType() == PIECE_TYPE_KING &&
       capturedPiece.getPieceColor() == _protectedPieceColor) {
        _checkFound = true;
        return false;
    }

    return true;
}
    
bool FindCheckCondition::checkFound() {
    return _checkFound;
}


class FilterKingExposingVisitors: public MoveVisitor {
public:
    FilterKingExposingVisitors(const BoardConfig &boardConfig,
                               PIECE_COLOR protectedPieceColor,
                               MoveVisitor &underlying):
    _underlying(underlying), _protectedPieceColor(protectedPieceColor), _startBoard(boardConfig) {
        
    }
    
    bool visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordiante) {
        // If this is a castling move, we should ensure that the king isn't in check
        // prior to the move, as well as after it
        if(_startBoard.getMoveType(startCoordinate, endCoordiante) & MOVE_TYPE_CASTLING) {
            int kingTravelStartCol, kingTravelEndCol;
            if(startCoordinate.getCol() < endCoordiante.getCol()) {
                kingTravelStartCol = startCoordinate.getCol();
                kingTravelEndCol = startCoordinate.getCol()+1;
            } else
            {
                kingTravelStartCol = startCoordinate.getCol()-1;
                kingTravelEndCol = startCoordinate.getCol();
            }

            FindTargetVisitor v(BoardCoordinate(kingTravelStartCol, startCoordinate.getRow()), BoardCoordinate(kingTravelEndCol, startCoordinate.getRow()));
            _startBoard.visitAllImmediateMoves(!_protectedPieceColor, v);
            if(v.found()) {
                return true;
            }
        }
        
        // All moves are checked that they don't result in a
        // check
        // Save board and apply move
        BoardConfig savedBoard = _startBoard;
        _startBoard.applyMove(startCoordinate, endCoordiante);
        
        // Did we create a self 'check'?
        FindCheckCondition checkVisitor(_startBoard, _protectedPieceColor);
        _startBoard.visitAllImmediateMoves(!_protectedPieceColor, checkVisitor);
        
        // (Restore board config)
        _startBoard = savedBoard;
        
        if(!checkVisitor.checkFound()) {
            return _underlying.visitPieceMove(startCoordinate, endCoordiante);
        } else {
            return true;
        }
    }

private:
    MoveVisitor &_underlying;
    BoardConfig _startBoard;
    PIECE_COLOR _protectedPieceColor;
};


BoardConfig::BoardConfig() {
   clear();
}

BoardConfig::~BoardConfig() {

  
}

void BoardConfig::clear() {
   memset(_boardContents, 0, 32);
   memset(_playerState, 0, sizeof(_playerState));
}

void BoardConfig::loadForNewGame() {
  PIECE_TYPE pieceRow[] = { 
    PIECE_TYPE_ROOK, PIECE_TYPE_KNIGHT, PIECE_TYPE_BISHOP,   
    PIECE_TYPE_QUEEN, PIECE_TYPE_KING, 
    PIECE_TYPE_BISHOP, PIECE_TYPE_KNIGHT, PIECE_TYPE_ROOK };

  clear();
    
  for(int col=0; col<8; col++) {
    setPieceAt(BoardCoordinate(col, 0), BoardPiece(pieceRow[col], PIECE_COLOR_WHITE));
    setPieceAt(BoardCoordinate(col, 1), BoardPiece(PIECE_TYPE_PAWN, PIECE_COLOR_WHITE));

    setPieceAt(BoardCoordinate(col, 6), BoardPiece(PIECE_TYPE_PAWN, PIECE_COLOR_BLACK));    
    setPieceAt(BoardCoordinate(col, 7), BoardPiece(pieceRow[col], PIECE_COLOR_BLACK));
  }
}

BoardPiece BoardConfig::getPieceAt(const BoardCoordinate &coordinate) const {
  int coordIdx = coordinate.getCompact();
  unsigned char pieceCompact = _boardContents[coordIdx/2];
  if(coordIdx & 1) {
    pieceCompact = pieceCompact & 0xf;  
  } else {
    pieceCompact = pieceCompact >> 4;
  }

  return BoardPiece(pieceCompact);
}


void BoardConfig::removePieceAt(const BoardCoordinate &coordinate) {
    setPieceAt(coordinate, BoardPiece(0, 0));
}

void BoardConfig::setPieceAt(const BoardCoordinate &coordinate, const BoardPiece &piece) {
  int coordIdx = coordinate.getCompact();

  if(coordIdx & 1) {
    _boardContents[coordIdx/2] = (_boardContents[coordIdx/2] & 0xf0) | piece.getCompact(); 
  } else {
    _boardContents[coordIdx/2] = (_boardContents[coordIdx/2] & 0x0f) | (piece.getCompact() << 4); 
  }
}

bool BoardConfig::findPiece(const BoardPiece &piece, BoardCoordinate &out) const {
    for(int r = 0; r < 8; r++) {
        for(int c = 0; c < 8; c++) {
            BoardCoordinate coord = BoardCoordinate(c, r);
            
            if(getPieceAt(coord).getCompact() == piece.getCompact()) {
                out = coord;
                return true;
            }
        }
    }

    return false;
}

void BoardConfig::visitMovablePieces(PIECE_COLOR movingColor, MoveVisitor &visitor) const {
    SingleMovePerPieceVisitor smVisitor(visitor);
    
    for(int r = 0; r < 8; r++) {
        for(int c = 0; c < 8; c++) {
            BoardCoordinate coord = BoardCoordinate(c, r);
            
            if(getPieceAt(coord).isPieceInColor(movingColor)) {
                visitMovesForPieceAt(coord, smVisitor);
            }
        }
    }
}

bool BoardConfig::visitAllImmediateMoves(PIECE_COLOR movingColor, MoveVisitor &visitor) const {
    for(int r = 0; r < 8; r++) {
        for(int c = 0; c < 8; c++) {
            BoardCoordinate coord = BoardCoordinate(c, r);
            
            if(getPieceAt(coord).isPieceInColor(movingColor)) {
                if(!visitImmediateMovesForPieceAt(coord, visitor)) {
                    return false;
                }
            }
        }
    }
    
    return true;
}


void BoardConfig::visitMovesForPieceAt(const BoardCoordinate &coordinate, MoveVisitor &visitor) const {
    
    FilterKingExposingVisitors movesFilter(*this, getPieceAt(coordinate).getPieceColor(), visitor);
    visitImmediateMovesForPieceAt(coordinate, movesFilter);
}
    
bool BoardConfig::visitImmediateMovesForPieceAt(const BoardCoordinate &coordinate, MoveVisitor &visitor) const {
    
    BoardPiece p = getPieceAt(coordinate);
    PIECE_COLOR movingColor = p.getPieceColor();
    BoardCoordinate target(0,0);
    int maxSteps = 8;
    int playerStateFlags = _playerState[movingColor]._flags;
    
    switch(p.getPieceType()) {
        case PIECE_TYPE_KING:
            if(!(playerStateFlags & PLAYER_STATE_FLAG_KING_MOVED)) {
                if(!(playerStateFlags & PLAYER_STATE_FLAG_ROOK0_MOVED)) {
                    if(!visitCastlingIfPathClear(movingColor, coordinate, BoardCoordinate(0, coordinate.getRow()), visitor)) {
                        return false;
                    }
                }

                if(!(playerStateFlags & PLAYER_STATE_FLAG_ROOK7_MOVED)) {
                    if(!visitCastlingIfPathClear(movingColor, coordinate, BoardCoordinate(7, coordinate.getRow()), visitor)) {
                        return false;
                    }
                }
            }
            maxSteps = 1;
            
        case PIECE_TYPE_QUEEN:
            return visitOfsMove(coordinate, p.getPieceColor(), -1, -1, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), -1, 0, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), -1, 1, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), 0, -1, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), 0, 0, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), 0, 1, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), 1, -1, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), 1, 0, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), 1, 1, maxSteps, visitor);
            
        case PIECE_TYPE_ROOK:
            return visitOfsMove(coordinate, p.getPieceColor(), -1, 0, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), 1, 0, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), 0, -1, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), 0, 1, maxSteps, visitor);
            
        case PIECE_TYPE_BISHOP:
            return visitOfsMove(coordinate, p.getPieceColor(), 1, -1, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), 1, 1, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), -1, -1, maxSteps, visitor) &&
                visitOfsMove(coordinate, p.getPieceColor(), -1, 1, maxSteps, visitor);

        case PIECE_TYPE_KNIGHT:
            for(int twoStep = -2; twoStep < 3; twoStep+=4 ) {
                for(int oneStep = -1; oneStep < 2; oneStep+=2 ) {
                    if(!(visitOfsMove(coordinate, p.getPieceColor(), twoStep, oneStep, 1, visitor) &&
                         visitOfsMove(coordinate, p.getPieceColor(), oneStep, twoStep, 1, visitor))) {
                        return false;
                    }
                }
            }
            
            return true;
            
        case PIECE_TYPE_PAWN: {
            int impRow = p.getPieceColor() == PIECE_COLOR_WHITE ? 1 : 6;
            int rofs = p.getPieceColor() == PIECE_COLOR_WHITE ? 1 : -1;

            if(coordinate.loadWithOffset(0, rofs, target) &&
               !getPieceAt(target).getPieceType()) {
                 if(!visitor.visitPieceMove(coordinate, target)) {
                    return false;
                 }
                
                if(coordinate.getRow() == impRow) {
                    if(coordinate.loadWithOffset(0, 2*rofs, target) &&
                       !getPieceAt(target).getPieceType()) {
                        if(!visitor.visitPieceMove(coordinate, target)) {
                           return false;
                        }
                    }
                }
            }
            
            for(int dofs = -1; dofs<2; dofs+=2) {
                if( coordinate.loadWithOffset(dofs, rofs, target) &&
                   getPieceAt(target).isPieceInColor(!p.getPieceColor())) {
                    if(!visitor.visitPieceMove(coordinate, target)) {
                        return false;
                    }
                }
            }
            
            return true;
        }
            
        default:
            return true;
            break;
    }
}

bool BoardConfig::visitCastlingIfPathClear(PIECE_COLOR castlingColor, const BoardCoordinate &king, const BoardCoordinate &rook, MoveVisitor &visitor) const {
    int clearScheduleStartCol, clearScheduleEndCol;
    if(king.getCol() < rook.getCol()) {
        clearScheduleStartCol = king.getCol()+1;
        clearScheduleEndCol = rook.getCol()-1;
    } else
    {
        clearScheduleStartCol = rook.getCol()+1;
        clearScheduleEndCol = king.getCol()-1;
    }
    
    for(int col=clearScheduleStartCol; col<=clearScheduleEndCol; col++) {
        if(getPieceAt(BoardCoordinate(col, king.getRow())).getPieceType() != 0) {
            return true;
        }
    }
    
    return visitor.visitPieceMove(king, rook);
}

bool BoardConfig::visitOfsMove(const BoardCoordinate& start, PIECE_COLOR movingColor,
                               signed char dc, signed char dr,
                               unsigned char maxSteps,
                               MoveVisitor &visitor) const {
    BoardCoordinate target(start);
    do {
        // Out of board -- done
        if(!target.loadWithOffset(dc, dr, target)) {
            return true;
        }
        
        // Got to a blocking piece -- done
        if(getPieceAt(target).isPieceInColor(movingColor)) {
            return true;
        }
        
        // Terminate
        if(!visitor.visitPieceMove(start, target)) {
            return false;
        }
        
        // Capture piece -- finish search
        if(getPieceAt(target).isPieceInColor(!movingColor)) {
            return true;
        }
    } while(--maxSteps);
    
    return true;
}

MOVE_TYPE BoardConfig::applyMove(const BoardCoordinate &from, const BoardCoordinate &to) {
    BoardPiece movedPiece = getPieceAt(from);
    MOVE_TYPE moveType = getMoveType(from, to);
    
    if(moveType & MOVE_TYPE_CAPTURE) {
        // Remove piece and update score
        BoardPiece removedPiece = getPieceAt(to);
        removePieceAt(to);
        _playerState[movedPiece.getPieceColor()]._score += PIECE_TYPE_VALUE[removedPiece.getPieceType()];
    }

    if(moveType & MOVE_TYPE_CASTLING) {
        BoardPiece castlingRook = getPieceAt(to);
        
        BoardCoordinate newKingCoord, newRookCoord;
        
        if(from.getCol() > to.getCol()) {
            from.loadWithOffset(-2, 0, newKingCoord);
            newKingCoord.loadWithOffset(1, 0, newRookCoord);
        } else {
            from.loadWithOffset(2, 0, newKingCoord);
            newKingCoord.loadWithOffset(-1, 0, newRookCoord);
        }
        
        removePieceAt(from);
        removePieceAt(to);
        
        setPieceAt(newKingCoord, movedPiece);
        setPieceAt(newRookCoord, castlingRook);
        
        _playerState[movedPiece.getPieceColor()]._flags |=
            PLAYER_STATE_FLAG_KING_MOVED |
            ((to.getCol() == 0) ? PLAYER_STATE_FLAG_ROOK0_MOVED : PLAYER_STATE_FLAG_ROOK7_MOVED);
    } else {
        removePieceAt(from);
        setPieceAt(to, movedPiece);
    
        if(movedPiece.getPieceType() == PIECE_TYPE_ROOK) {
            if(from.getCol() == 0) {
                _playerState[movedPiece.getPieceColor()]._flags |= PLAYER_STATE_FLAG_ROOK0_MOVED;
            } else
            if(from.getCol() == 7) {
                _playerState[movedPiece.getPieceColor()]._flags |= PLAYER_STATE_FLAG_ROOK7_MOVED;
            }
        } else
        if(movedPiece.getPieceType() == PIECE_TYPE_KING) {
            _playerState[movedPiece.getPieceColor()]._flags |= PLAYER_STATE_FLAG_KING_MOVED;
        }
    }

    return moveType;
}

void BoardConfig::addTurnTime(PIECE_COLOR player, int centiseconds) {
    _playerState[player]._gameTime += centiseconds;
}


MOVE_TYPE BoardConfig::getMoveType(const BoardCoordinate &from, const BoardCoordinate &to) const {
    BoardPiece movingPiece = getPieceAt(from);
    BoardPiece targetPiece = getPieceAt(to);
    
    MOVE_TYPE result = 0;
    if((to.getRow() == 0 || to.getRow() == 7) && movingPiece.getPieceType() == PIECE_TYPE_PAWN) {
        result |= MOVE_TYPE_PROMOTION;
    }
    
    if(targetPiece.getPieceType() != 0) {
        if(targetPiece.getPieceColor() != movingPiece.getPieceColor()) {
            result |= MOVE_TYPE_CAPTURE;
        } else {
            if(targetPiece.getPieceType() == PIECE_TYPE_ROOK && movingPiece.getPieceType() == PIECE_TYPE_KING) {
                result |= MOVE_TYPE_CASTLING;
            }
        }
    }
    
    return result;
}

const PlayerState &BoardConfig::getPlayerState(PIECE_COLOR player) const {
    return _playerState[player];
}


FindTargetVisitor::FindTargetVisitor(BoardCoordinate target):
    _desiredTargetStart(target), _desiredTargetEnd(target), _targetFound(false)
{
}

FindTargetVisitor::FindTargetVisitor(BoardCoordinate startTarget, BoardCoordinate endTarget):
    _desiredTargetStart(startTarget), _desiredTargetEnd(endTarget), _targetFound(false)
{
    
}

bool FindTargetVisitor::visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordinate) {
    if(_desiredTargetStart.getCol() <= endCoordinate.getCol() &&
       _desiredTargetStart.getRow() <= endCoordinate.getRow() &&
       _desiredTargetEnd.getCol() >= endCoordinate.getCol() &&
       _desiredTargetEnd.getRow() >= endCoordinate.getRow()) {
        _targetFound = true;
        return false;
    }
    
    return true;
}
    
bool FindTargetVisitor::found() const {
    return _targetFound;
}
