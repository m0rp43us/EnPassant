import 'package:en_passant/model/app_model.dart';
import 'package:en_passant/views/components/main_menu_view/side_picker.dart';

bool tileInBounds(int tile) {
  return tile >= 0 && tile < 64;
}

int tileToRow(int tile) { return (tile / 8).floor(); }

int tileToCol(int tile) { return tile % 8; }

double getXFromTile(int tile, double tileSize, AppModel appModel) {
  return appModel.playingWithAI && appModel.playerSide == Player.player2 ? 
    (7 - tileToCol(tile)) * tileSize : tileToCol(tile) * tileSize;
}

double getYFromTile(int tile, double tileSize, AppModel appModel) {
  return appModel.playingWithAI && appModel.playerSide == Player.player2 ? 
    tileToRow(tile) * tileSize : (7 - tileToRow(tile)) * tileSize;
}

Player oppositePlayer(Player player) {
  return player == Player.player1 ? Player.player2 : Player.player1;
}
