void oled_chessboard_show_piece(int xOffset, const BoardPiece &piece) {
  int imageOfs = 
    (6-piece.getPieceType())*32 + 
    ((piece.getPieceColor() == PIECE_COLOR_WHITE) ? 192 : 0);

  oled_write_image_pm(OledResourceChessPieces, 384, 0, xOffset, imageOfs, 32, 4);
}


void oled_chessboard_show_coord(int xOffset, const BoardCoordinate &coord) {
  int imageColOfs = coord.getCol() * 12;
  int imageRowOfs = (coord.getRow() + 8) * 12;
  
  oled_write_image_pm(OledResourceCoordinateFont, 192, 0, xOffset, imageColOfs, 12, 4);
  oled_write_image_pm(OledResourceCoordinateFont, 192, 0, xOffset+12, imageRowOfs, 12, 4);
}
