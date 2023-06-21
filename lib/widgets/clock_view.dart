import 'dart:async';
import 'dart:math';

import 'package:alarm_clock/theme/colors.dart';
import 'package:flutter/material.dart';

const _angleToRadian = pi / 180;

class ClockView extends StatefulWidget {
  const ClockView({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  late Timer timer;
  var now = DateTime.now();

  @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   setState(() {
    //     now = DateTime.now();
    //   });
    // });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        painter: ClockPainter(now),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  ClockPainter(this.now) : super();

  final DateTime now;

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY) * 0.9;

    final secLength = radius * 3 / 4;
    final minLength = radius * 4 / 5;
    final hourLength = radius * 1 / 2;

    // hourHand moves in small angle and more subtly, total minute will be used to demonstrate this movement
    // dt.hour % 12 to get hour in 12-hour format, then add up to get total minute from 00:00
    final hourAngle =
        (-90 + (now.hour % 12 * 60 + now.minute) * 0.5) * _angleToRadian;
    final hourHandX = centerX + hourLength * cos(hourAngle);
    final hourHandY = centerY + hourLength * sin(hourAngle);

    final minAngle = (-90 + now.minute * 6) * _angleToRadian; // 360/60
    final minHandX = centerX + minLength * cos(minAngle);
    final minHandY = centerY + minLength * sin(minAngle);

    final secAngle = (-90 + now.second * 6) * _angleToRadian; // 360/60
    final secHandX = centerX + secLength * cos(secAngle);
    final secHandY = centerY + secLength * sin(secAngle);

    final fillBrush = Paint()..color = CustomColors.clockBG;

    final outlineBrush = Paint()
      ..color = CustomColors.clockOutline
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var dashBrush = Paint()
      ..color = CustomColors.clockOutline
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    final centerFillBrush = Paint()..color = CustomColors.clockOutline;

    final secHandBrush = Paint()
      ..color = Colors.orange[300]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    final minHandBrush = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xFF748ef6),
          Color(0xFF77ddff),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    final hourHandBrush = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xFFea74ab),
          Color(0xFFc279fb),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    // background
    canvas.drawCircle(center, radius, fillBrush);
    // border
    canvas.drawCircle(center, radius, outlineBrush);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    // center circle
    canvas.drawCircle(center, 16, centerFillBrush);

    final outerCircleRadius = radius + 40;
    final innerCircleRadius = outerCircleRadius - 16;
    for (double i = 0; i < 360; i += 12) {
      final x1 = centerX + innerCircleRadius * cos(i * pi / 180);
      final y1 = centerY + innerCircleRadius * sin(i * pi / 180);
      final x2 = centerX + outerCircleRadius * cos(i * pi / 180);
      final y2 = centerY + outerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
