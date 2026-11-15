import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class TicketQrCard extends StatelessWidget {
  const TicketQrCard({
    super.key,
    required this.ticketNumber,
  });

  final String ticketNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          const Text(
            'Ticket QR Code',
            style: TextStyle(
              fontFamily: 'MyanmarKhyay',
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE5E7EB)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: CustomPaint(
              size: const Size(140, 140),
              painter: _QrCodePainter(seed: ticketNumber),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Show this QR code to the TTE on demand',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'MyanmarKhyay',
              color: AppColors.textSecondary,
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Keep your ticket & valid ID proof handy during the journey.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'MyanmarKhyay',
              color: AppColors.subtitleText,
              fontSize: 10.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _QrCodePainter extends CustomPainter {
  _QrCodePainter({required this.seed});

  final String seed;
  static const int _gridSize = 21;

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.width / _gridSize;
    final paint = Paint()..color = const Color(0xFF111827);

    final matrix = List.generate(
      _gridSize,
      (_) => List<bool>.filled(_gridSize, false),
    );

    _drawFinderPattern(matrix, 0, 0);
    _drawFinderPattern(matrix, _gridSize - 7, 0);
    _drawFinderPattern(matrix, 0, _gridSize - 7);

    for (var i = 8; i < _gridSize - 8; i++) {
      matrix[6][i] = i.isEven;
      matrix[i][6] = i.isEven;
    }

    var hash = 2166136261;
    for (final code in seed.codeUnits) {
      hash ^= code;
      hash = (hash * 16777619) & 0x7FFFFFFF;
    }

    for (var r = 0; r < _gridSize; r++) {
      for (var c = 0; c < _gridSize; c++) {
        if (_isReserved(r, c)) continue;
        hash ^= (r * 31 + c * 17);
        hash = (hash * 16777619) & 0x7FFFFFFF;
        matrix[r][c] = (hash & 1) == 1;
      }
    }

    for (var r = 0; r < _gridSize; r++) {
      for (var c = 0; c < _gridSize; c++) {
        if (matrix[r][c]) {
          canvas.drawRect(
            Rect.fromLTWH(c * cellSize, r * cellSize, cellSize, cellSize),
            paint,
          );
        }
      }
    }
  }

  void _drawFinderPattern(List<List<bool>> matrix, int row, int col) {
    for (var r = 0; r < 7; r++) {
      for (var c = 0; c < 7; c++) {
        final isBorder = r == 0 || r == 6 || c == 0 || c == 6;
        final isCenter = r >= 2 && r <= 4 && c >= 2 && c <= 4;
        matrix[row + r][col + c] = isBorder || isCenter;
      }
    }
  }

  bool _isReserved(int r, int c) {
    final topLeft = r < 8 && c < 8;
    final topRight = r < 8 && c >= _gridSize - 8;
    final bottomLeft = r >= _gridSize - 8 && c < 8;
    final timing = r == 6 || c == 6;
    return topLeft || topRight || bottomLeft || timing;
  }

  @override
  bool shouldRepaint(covariant _QrCodePainter oldDelegate) =>
      oldDelegate.seed != seed;
}
