import 'package:flutter/material.dart';

class SplashImage {
  static Widget buildSplashImage() {
    return FutureBuilder<bool>(
      future: _imageExists(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data == true) {
          // Load image from assets if available
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/mind and heart 2.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildDefaultSplashImage();
              },
            ),
          );
        }
        // Default painted splash image
        return _buildDefaultSplashImage();
      },
    );
  }

  static Future<bool> _imageExists() async {
    try {
      await AssetImage('assets/images/mind and heart 2.png').resolve(ImageConfiguration.empty);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Widget _buildDefaultSplashImage() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0891B2).withOpacity(0.1),
            Color(0xFFFB923C).withOpacity(0.1),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF0891B2).withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Brain icon
          CustomPaint(
            painter: BrainPainter(),
            size: const Size(120, 100),
          ),
        ],
      ),
    );
  }
}

class BrainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF0891B2)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final center = Offset(size.width / 2, size.height / 2);

    // Left brain hemisphere
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.dx - 25, center.dy - 10),
        width: 40,
        height: 50,
      ),
      0,
      3.14,
      false,
      paint,
    );

    // Right brain hemisphere
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.dx + 25, center.dy - 10),
        width: 40,
        height: 50,
      ),
      0,
      3.14,
      false,
      paint,
    );

    // Brain curves
    canvas.drawPath(
      Path()
        ..moveTo(center.dx - 30, center.dy)
        ..quadraticBezierTo(center.dx - 20, center.dy + 10, center.dx - 10, center.dy)
        ..quadraticBezierTo(center.dx, center.dy + 10, center.dx + 10, center.dy)
        ..quadraticBezierTo(center.dx + 20, center.dy + 10, center.dx + 30, center.dy),
      paint,
    );

    // Heart below
    final heartPaint = Paint()
      ..color = Color(0xFFFB923C)
      ..style = PaintingStyle.fill;

    _drawHeart(canvas, center + Offset(0, 40), 15, heartPaint);
  }

  void _drawHeart(Canvas canvas, Offset position, double size, Paint paint) {
    final path = Path();
    path.moveTo(position.dx, position.dy + size / 2);

    // Left bump
    path.cubicTo(
      position.dx - size * 0.5,
      position.dy - size * 0.3,
      position.dx - size * 0.7,
      position.dy - size * 0.5,
      position.dx - size * 0.3,
      position.dy - size * 0.2,
    );

    // Center
    path.cubicTo(
      position.dx - size * 0.1,
      position.dy - size * 0.4,
      position.dx + size * 0.1,
      position.dy - size * 0.4,
      position.dx + size * 0.3,
      position.dy - size * 0.2,
    );

    // Right bump
    path.cubicTo(
      position.dx + size * 0.7,
      position.dy - size * 0.5,
      position.dx + size * 0.5,
      position.dy - size * 0.3,
      position.dx,
      position.dy + size / 2,
    );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BrainPainter oldDelegate) => false;
}
