import 'package:flutter/material.dart';
import 'dart:math' as math;

class GenreDonutChart extends StatelessWidget {
  final List<Map<String, dynamic>> genres;

  const GenreDonutChart({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    final total = genres.fold<int>(0, (sum, g) => sum + (g['value'] as int));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 24),
          child: Text(
            'Gêneros mais ouvidos',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 24),
            SizedBox(
              width: 150,
              height: 150,
              child: CustomPaint(
                painter: _DonutChartPainter(genres: genres, total: total),
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: genres.map((g) {
                  final count = g['value'] as int;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: g['color'] as Color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            g['label'] as String,
                            style: const TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                        Text(
                          '$count músicas',
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ],
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> genres;
  final int total;

  _DonutChartPainter({required this.genres, required this.total});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 28.0;
    const gap = 0.04;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    double startAngle = -math.pi / 2;

    for (final genre in genres) {
      final sweep = (genre['value'] as int) / total * 2 * math.pi - gap;
      paint.color = genre['color'] as Color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweep,
        false,
        paint,
      );
      startAngle += sweep + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}