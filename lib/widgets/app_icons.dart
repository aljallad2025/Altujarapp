import 'dart:math' as math;
import 'package:flutter/material.dart';

/// أيقونة مرسومة بخطوط تطابق شكل الصورة المرجعية بالضبط
class AppIcon extends StatelessWidget {
  final AppIconType type;
  final double size;
  final Color color;
  final double strokeWidth;
  final bool filled;

  const AppIcon(this.type, {super.key, this.size = 24, this.color = Colors.white, this.strokeWidth = 1.7, this.filled = false});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _AppIconPainter(type, color, strokeWidth, filled),
    );
  }
}

enum AppIconType {
  docCheck,    // طلباتي
  gearBrief,   // الخدمات
  card,        // المدفوعات
  folder,      // المستندات
  docPen,      // التأسيس والتسجيل
  scale,       // السجل التجاري
  govBuilding, // التراخيص والتصاريح
  home,        // الرئيسية (نافبار)
  bell,        // الإشعارات (نافبار)
  person,      // حسابي (نافبار)
}

class _AppIconPainter extends CustomPainter {
  final AppIconType type;
  final Color color;
  final double strokeW;
  final bool filled;
  _AppIconPainter(this.type, this.color, this.strokeW, this.filled);

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24;
    canvas.save();
    canvas.scale(scale, scale);

    final stroke = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeW
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fill = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    switch (type) {
      case AppIconType.docCheck:
        _drawDocCheck(canvas, stroke, fill);
        break;
      case AppIconType.gearBrief:
        _drawGearBrief(canvas, stroke, fill);
        break;
      case AppIconType.card:
        _drawCard(canvas, stroke, fill);
        break;
      case AppIconType.folder:
        _drawFolder(canvas, stroke, fill);
        break;
      case AppIconType.docPen:
        _drawDocPen(canvas, stroke, fill);
        break;
      case AppIconType.scale:
        _drawScale(canvas, stroke);
        break;
      case AppIconType.govBuilding:
        _drawGovBuilding(canvas, stroke, fill);
        break;
      case AppIconType.home:
        _drawHome(canvas, stroke, fill);
        break;
      case AppIconType.bell:
        _drawBell(canvas, stroke, fill);
        break;
      case AppIconType.person:
        _drawPerson(canvas, stroke, fill);
        break;
    }
    canvas.restore();
  }

  // ── طلباتي: مستند بـ3 خطوط + دائرة بيضاء بعلامة صح ملوّنة ──
  void _drawDocCheck(Canvas c, Paint stroke, Paint fill) {
    final path = Path()
      ..moveTo(6, 3)
      ..lineTo(15, 3)
      ..lineTo(19, 7)
      ..lineTo(19, 21)
      ..lineTo(6, 21)
      ..close();
    c.drawPath(path, stroke);
    c.drawLine(const Offset(8, 8), const Offset(15, 8), stroke);
    c.drawLine(const Offset(8, 11), const Offset(16, 11), stroke);
    c.drawLine(const Offset(8, 14), const Offset(13, 14), stroke);
    c.drawCircle(const Offset(16.5, 17.3), 3.7, Paint()..color = Colors.white..style = PaintingStyle.fill);
    final check = Path()
      ..moveTo(14.8, 17.4)
      ..lineTo(16, 18.6)
      ..lineTo(18.2, 16.1);
    c.drawPath(check, Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.7
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round);
  }

  // ── الخدمات: ترس مفرغ (يسار) + حقيبة مصمتة بيضاء (يمين) ──
  void _drawGearBrief(Canvas c, Paint stroke, Paint fill) {
    // الترس (outline) على اليسار
    const gc = Offset(7.3, 8);
    const rOuter = 4.3;
    const rInner = 3.0;
    final gearPath = Path();
    const teeth = 8;
    for (int i = 0; i < teeth * 2; i++) {
      final angle = i * math.pi / teeth - math.pi / 2;
      final r = i.isEven ? rOuter : rInner;
      final x = gc.dx + r * math.cos(angle);
      final y = gc.dy + r * math.sin(angle);
      if (i == 0) {
        gearPath.moveTo(x, y);
      } else {
        gearPath.lineTo(x, y);
      }
    }
    gearPath.close();
    c.drawPath(gearPath, stroke);
    // قوس داخلي غير مكتمل (بدل دائرة كاملة)
    final rectArc = Rect.fromCircle(center: gc, radius: 1.7);
    c.drawArc(rectArc, -math.pi * 0.85, math.pi * 1.5, false, stroke);

    // الحقيبة المصمتة على اليمين (تتراكب فوق الترس)
    final bagOuter = Path()
      ..moveTo(11.5, 12.3)
      ..lineTo(11.5, 10.3)
      ..quadraticBezierTo(11.5, 9, 13, 9)
      ..lineTo(15.5, 9)
      ..quadraticBezierTo(17, 9, 17, 10.3)
      ..lineTo(17, 12.3)
      ..lineTo(21.2, 12.3)
      ..quadraticBezierTo(22.3, 12.3, 22.3, 13.5)
      ..lineTo(22.3, 19.3)
      ..quadraticBezierTo(22.3, 20.5, 21.2, 20.5)
      ..lineTo(9.8, 20.5)
      ..quadraticBezierTo(8.7, 20.5, 8.7, 19.3)
      ..lineTo(8.7, 13.5)
      ..quadraticBezierTo(8.7, 12.3, 9.8, 12.3)
      ..close();
    c.saveLayer(const Rect.fromLTWH(6, 8, 18, 15), Paint());
    c.drawPath(bagOuter, Paint()..color = color..style = PaintingStyle.fill);
    final clear = Paint()..blendMode = BlendMode.clear;
    // فتحة المقبض
    c.drawRect(const Rect.fromLTWH(12.5, 10.2, 3, 2.1), clear);
    // خط فصل الغطاء
    c.drawRect(const Rect.fromLTWH(8.7, 14.6, 13.6, 1.0), clear);
    // القفل fill بلون الأيقونة فوق الخط (يرسم بعد المسح كعنصر منفصل خارج الطبقة)
    c.restore();
    c.drawRect(const Rect.fromLTWH(14.7, 14.1, 2.2, 1.9), Paint()..color = color..style = PaintingStyle.fill);
  }

  // ── المدفوعات: إطار بطاقة (خط) + شريط ودوائر مصمتة بيضاء ──
  void _drawCard(Canvas c, Paint stroke, Paint fill) {
    final rrect = RRect.fromRectAndRadius(const Rect.fromLTWH(2, 6, 20, 13), const Radius.circular(2.4));
    c.drawRRect(rrect, stroke);
    c.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(2.9, 8.8, 18.2, 2.6), const Radius.circular(1)), fill);
    c.drawRect(const Rect.fromLTWH(4.8, 14.3, 4.2, 1.3), fill);
    c.drawCircle(const Offset(16.1, 15.3), 2.0, fill);
    c.drawCircle(const Offset(18.4, 15.3), 2.0, fill);
  }

  // ── المستندات: مجلد - خلفية مفرغة (outline) + غطاء أمامي مصمت ──
  void _drawFolder(Canvas c, Paint stroke, Paint fill) {
    final back = Path()
      ..moveTo(3.2, 7.2)
      ..lineTo(3.2, 18.5)
      ..lineTo(20.8, 18.5)
      ..lineTo(20.8, 8.7)
      ..lineTo(11.3, 8.7)
      ..lineTo(9.6, 6.6)
      ..lineTo(4.7, 6.6)
      ..quadraticBezierTo(3.2, 6.6, 3.2, 7.2)
      ..close();
    c.drawPath(back, stroke);
    final front = Path()
      ..moveTo(2.6, 11.2)
      ..quadraticBezierTo(2.6, 10.2, 3.6, 10.2)
      ..lineTo(20.4, 10.2)
      ..quadraticBezierTo(21.4, 10.2, 21.1, 11.2)
      ..lineTo(19.6, 18.4)
      ..quadraticBezierTo(19.3, 19.3, 18.3, 19.3)
      ..lineTo(4.4, 19.3)
      ..quadraticBezierTo(3.4, 19.3, 3.1, 18.4)
      ..close();
    c.drawPath(front, Paint()..color = color..style = PaintingStyle.fill);
  }

  // ── التأسيس والتسجيل: مستند بقائمة تشيك داخل صندوق + قلم ──
  void _drawDocPen(Canvas c, Paint stroke, Paint fill) {
    final path = Path()
      ..moveTo(5, 3)
      ..lineTo(13.5, 3)
      ..lineTo(17, 6.5)
      ..lineTo(17, 21)
      ..lineTo(5, 21)
      ..close();
    c.drawPath(path, stroke);
    c.drawLine(const Offset(8, 8), const Offset(15, 8), stroke);
    // صندوق قائمة التشيك
    c.drawRRect(RRect.fromRectAndRadius(const Rect.fromLTWH(6.7, 9.8, 3, 6.4), const Radius.circular(0.6)), stroke);
    for (final y in [11.2, 13.0, 14.8]) {
      final tick = Path()
        ..moveTo(7.3, y)
        ..lineTo(7.8, y + 0.5)
        ..lineTo(8.8, y - 0.6);
      c.drawPath(tick, Paint()
        ..color = color..style = PaintingStyle.stroke..strokeWidth = 0.9..strokeCap = StrokeCap.round..strokeJoin = StrokeJoin.round);
    }
    c.drawLine(const Offset(10.2, 11.2), const Offset(15, 11.2), stroke);
    c.drawLine(const Offset(10.2, 13.0), const Offset(15, 13.0), stroke);
    c.drawLine(const Offset(10.2, 14.8), const Offset(13.5, 14.8), stroke);
    final pen = Path()
      ..moveTo(13.5, 18)
      ..lineTo(18.3, 13.2)
      ..lineTo(20.1, 15)
      ..lineTo(15.3, 19.8)
      ..lineTo(12.8, 20.4)
      ..close();
    c.drawPath(pen, stroke);
  }

  // ── السجل التجاري: ميزان بقاعدة وعارضة منحنية ──
  void _drawScale(Canvas c, Paint stroke) {
    c.drawLine(const Offset(12, 4), const Offset(12, 18.5), stroke);
    final topBar = Path()
      ..moveTo(5.2, 6.8)
      ..quadraticBezierTo(12, 4.5, 18.8, 6.8);
    c.drawPath(topBar, stroke);
    // قاعدة
    c.drawLine(const Offset(8.5, 20.5), const Offset(15.5, 20.5), stroke);
    c.drawLine(const Offset(9.5, 18.5), const Offset(14.5, 18.5), stroke);
    c.drawLine(const Offset(10.3, 20.5), const Offset(10.3, 18.5), stroke);
    c.drawLine(const Offset(13.7, 20.5), const Offset(13.7, 18.5), stroke);
    final leftPan = Path()
      ..moveTo(5.2, 6.8)
      ..lineTo(2.6, 12)
      ..quadraticBezierTo(5.2, 14.2, 7.8, 12)
      ..close();
    c.drawPath(leftPan, stroke);
    final rightPan = Path()
      ..moveTo(18.8, 6.8)
      ..lineTo(16.2, 12)
      ..quadraticBezierTo(18.8, 14.2, 21.4, 12)
      ..close();
    c.drawPath(rightPan, stroke);
  }

  // ── التراخيص والتصاريح: مبنى بقبة دائرية + أعمدة + علم ──
  void _drawGovBuilding(Canvas c, Paint stroke, Paint fill) {
    // العلم
    c.drawLine(const Offset(12, 1.6), const Offset(12, 4.2), stroke);
    final flag = Path()
      ..moveTo(12, 1.8)
      ..lineTo(14.6, 2.4)
      ..lineTo(12, 3.1)
      ..close();
    c.drawPath(flag, fill);
    // القبة
    final domeRect = Rect.fromCircle(center: const Offset(12, 8.4), radius: 4.4);
    c.drawArc(domeRect, math.pi, math.pi, false, stroke);
    c.drawLine(const Offset(7.6, 8.4), const Offset(16.4, 8.4), stroke);
    // الحافة تحت القبة
    c.drawLine(const Offset(5.5, 10.2), const Offset(18.5, 10.2), stroke);
    // الأعمدة بأقواس علوية بسيطة
    for (final x in [7.0, 10.0, 13.0, 16.0]) {
      c.drawLine(Offset(x, 11.3), Offset(x, 18.3), stroke);
    }
    c.drawLine(const Offset(5.5, 18.6), const Offset(18.5, 18.6), stroke);
    c.drawLine(const Offset(4.2, 20.2), const Offset(19.8, 20.2), stroke);
    c.drawLine(const Offset(3, 21.6), const Offset(21, 21.6), stroke);
  }

  void _drawHome(Canvas c, Paint stroke, Paint fill) {
    if (filled) {
      final path = Path()
        ..moveTo(4, 10.5)
        ..lineTo(12, 3.5)
        ..lineTo(20, 10.5)
        ..lineTo(20, 20)
        ..lineTo(4, 20)
        ..close();
      c.drawPath(path, fill);
      final doorway = Paint()..color = Colors.white..style = PaintingStyle.fill;
      c.drawRect(const Rect.fromLTWH(10, 14, 4, 6), doorway);
    } else {
      final path = Path()
        ..moveTo(4, 10.5)
        ..lineTo(12, 3.5)
        ..lineTo(20, 10.5);
      c.drawPath(path, stroke);
      final body = Path()
        ..moveTo(6, 9.5)
        ..lineTo(6, 20)
        ..lineTo(18, 20)
        ..lineTo(18, 9.5);
      c.drawPath(body, stroke);
    }
  }

  void _drawBell(Canvas c, Paint stroke, Paint fill) {
    final path = Path()
      ..moveTo(18, 8)
      ..cubicTo(18, 4.7, 15.3, 2, 12, 2)
      ..cubicTo(8.7, 2, 6, 4.7, 6, 8)
      ..cubicTo(6, 13.4, 4, 15.5, 4, 15.5)
      ..lineTo(20, 15.5)
      ..cubicTo(20, 15.5, 18, 13.4, 18, 8)
      ..close();
    c.drawPath(path, filled ? fill : stroke);
    c.drawLine(const Offset(10.2, 18), const Offset(13.8, 18), Paint()
      ..color = color..style = PaintingStyle.stroke..strokeWidth = strokeW..strokeCap = StrokeCap.round);
  }

  void _drawPerson(Canvas c, Paint stroke, Paint fill) {
    c.drawCircle(const Offset(12, 8), 3.6, filled ? fill : stroke);
    final body = Path()
      ..moveTo(5, 20.5)
      ..quadraticBezierTo(5, 14.5, 12, 14.5)
      ..quadraticBezierTo(19, 14.5, 19, 20.5);
    c.drawPath(body, filled ? fill : stroke);
  }

  @override
  bool shouldRepaint(covariant _AppIconPainter oldDelegate) =>
      oldDelegate.type != type || oldDelegate.color != color || oldDelegate.strokeW != strokeW || oldDelegate.filled != filled;
}
