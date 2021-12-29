#ifndef __BOARD_H__
#define __BOARD_H__

typedef unsigned char PIECE_TYPE;
#define PIECE_TYPE_KING 1
#define PIECE_TYPE_QUEEN 2
#define PIECE_TYPE_ROOK 3
#define PIECE_TYPE_KNIGHT 4
#define PIECE_TYPE_BISHOP 5
#define PIECE_TYPE_PAWN 6


typedef unsigned char PIECE_COLOR;
#define PIECE_COLOR_BLACK 0
#define PIECE_COLOR_WHITE 1 

typedef unsigned char MOVE_TYPE;
#define MOVE_TYPE_SIMPLE 0
#define MOVE_TYPE_CAPTURE 1
#define MOVE_TYPE_CASTLING 2
#define MOVE_TYPE_PROMOTION 4

const char PIECE_TYPE_VALUE[] = { 0, 0, 9, 5, 3, 3, 1 };

struct PlayerState {
    char _flags;
    short _score;
    int _gameTime;
} ;

#define PLAYER_STATE_FLAG_ROOK0_MOVED 1
#define PLAYER_STATE_FLAG_ROOK7_MOVED 2
#define PLAYER_STATE_FLAG_KING_MOVED  4

class BoardPiece {
public:
  BoardPiece(PIECE_TYPE type, PIECE_COLOR color): _value((color << 3) | type) {}
  BoardPiece(unsigned char compact): _value(compact) {}

  PIECE_TYPE getPieceType() const { return _value & 7; }
  PIECE_COLOR getPieceColor() const { return _value & 8 ? PIECE_COLOR_WHITE : PIECE_COLOR_BLACK; }

  bool isPieceInColor(PIECE_COLOR color) const { return getPieceType() && getPieceColor() == color; }

  unsigned char getCompact() const { return _value; }       // 4 bit

  bool operator==(const BoardPiece &other) const { return _value == other._value; }
  void operator=(const BoardPiece &other) { _value = other._value; }

private:
  unsigned char _value;
};

class BoardCoordinate {
public:
  BoardCoordinate(unsigned char col, unsigned char row): _coordinate(row*8 + col) {}
  BoardCoordinate(): _coordinate(0) {}
  
  unsigned char getCol() const { return _coordinate & 7; }
  unsigned char getRow() const { return _coordinate >> 3; }

  unsigned char getCompact() const { return _coordinate; }  // 6 bit

  bool loadWithOffset(int cOfs, int rOfs, BoardCoordinate &dest) const;
    
  bool operator==(const BoardCoordinate &other) const { return _coordinate == other._coordinate; }
  void operator=(const BoardCoordinate &other) { _coordinate = other._coordinate; }
private:
  unsigned char _coordinate;
};

class MoveVisitor {
public:
    virtual bool visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordiante) = 0;
};

class BoardConfig {
public: 
  BoardConfig();
  ~BoardConfig();

  void loadForNewGame();
  
  BoardPiece getPieceAt(const BoardCoordinate &coordinate) const;
  void setPieceAt(const BoardCoordinate &coordinate, const BoardPiece &piece);
  void removePieceAt(const BoardCoordinate &coordinate);

  bool findPiece(const BoardPiece &piece, BoardCoordinate &out) const;
  
  void visitMovablePieces(PIECE_COLOR movingColor, MoveVisitor &visitor) const;
  bool visitAllImmediateMoves(PIECE_COLOR movingColor, MoveVisitor &visitor) const;
  void visitMovesForPieceAt(const BoardCoordinate &coordinate, MoveVisitor &visitor) const;
  bool visitAllMoves(PIECE_COLOR movingColor, MoveVisitor &visitor) const;
    
  MOVE_TYPE applyMove(const BoardCoordinate &from, const BoardCoordinate &to);
  MOVE_TYPE getMoveType(const BoardCoordinate &from, const BoardCoordinate &to) const;

  void addTurnTime(PIECE_COLOR player, int centiseconds);

  const PlayerState &getPlayerState(PIECE_COLOR player) const;

  void loadPlayerStateFromCustomBoardPosition();

private:
  void clear();

  bool visitImmediateMovesForPieceAt(const BoardCoordinate &coordinate, MoveVisitor &visitor) const;
  bool visitOfsMove(const BoardCoordinate& start, PIECE_COLOR movingColor, signed char dc, signed char dr,
                    unsigned char maxSteps, MoveVisitor &visitor) const;
  bool visitCastlingIfPathClear(PIECE_COLOR castlingColor, const BoardCoordinate &king,
                                const BoardCoordinate &rook, MoveVisitor &visitor) const;

  unsigned char _boardContents[32];
  PlayerState _playerState[2];

} ;

class FindTargetVisitor: public MoveVisitor {
public:
    FindTargetVisitor(BoardCoordinate target);
    FindTargetVisitor(BoardCoordinate startTarget, BoardCoordinate endTarget);

    bool visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordinate);
    bool found() const;
    
private:
    BoardCoordinate _desiredTargetStart;
    BoardCoordinate _desiredTargetEnd;
    bool _targetFound;
};

class FindCheckCondition: public MoveVisitor {
public:
    FindCheckCondition(const BoardConfig &boardConfig,
                        PIECE_COLOR protectedPieceColor);    
    bool visitPieceMove(BoardCoordinate startCoordinate, BoardCoordinate endCoordiante);    
    bool checkFound();

private:
    BoardConfig _startBoard;
    PIECE_COLOR _protectedPieceColor;
    bool _checkFound;
};



#endif
