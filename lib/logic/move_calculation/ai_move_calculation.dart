import 'dart:math';

import 'package:en_passant/logic/move_calculation/move_classes/move_and_value.dart';
import 'package:en_passant/views/components/main_menu_view/ai_difficulty_picker.dart';
import 'package:en_passant/views/components/main_menu_view/side_picker.dart';

import '../chess_board.dart';
import 'move_calculation.dart';
import '../shared_functions.dart';
import 'move_classes/move.dart';

const INITIAL_ALPHA = -20000;
const INITIAL_BETA = 20000;

class AIMoveCalculation {
  static Move move(Player aiPlayer, AIDifficulty aiDifficulty,
    ChessBoard board) {
    return _alphaBeta(
      board, aiPlayer, null, 0,
      _maxDepth(aiDifficulty), INITIAL_ALPHA, INITIAL_BETA
    ).move;
  }

  static MoveAndValue _alphaBeta(ChessBoard board, Player player, Move move,
    int depth, int maxDepth, int alpha, int beta) {
    if (depth == maxDepth) {
      return MoveAndValue(move, boardValue(board));
    }
    var bestMove = MoveAndValue(null,
      player == Player.player1 ? INITIAL_ALPHA : INITIAL_BETA);
    for (var move in allMoves(player, board)) {
      push(move, board);
      var result = _alphaBeta(
        board, oppositePlayer(player), move,
        depth + 1, maxDepth, alpha, beta);
      result.move = move;
      pop(board);
      if (player == Player.player1) {
        if (result.value > bestMove.value) { bestMove = result; }
        alpha = max(alpha, bestMove.value);
        if (alpha >= beta) { break; }
      } else {
        if (result.value < bestMove.value) { bestMove = result; }
        beta = min(beta, bestMove.value);
        if (beta <= alpha) { break; }
      }
    }
    return bestMove;
  }

  static int _maxDepth(AIDifficulty aiDifficulty) {
    switch (aiDifficulty) {
      case AIDifficulty.easy: { return 1; }
      case AIDifficulty.normal: { return 3; }
      case AIDifficulty.hard: { return 5; }
      default: { return 0; }
    }
  }
}
