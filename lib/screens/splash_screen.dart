import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'app_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const AppShell()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('التّجـار',
                style: GoogleFonts.cairo(
                    fontSize: 34, fontWeight: FontWeight.w800, color: AppColors.card)),
            const SizedBox(height: 6),
            Text('ALTUJAR™',
                style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.gold, letterSpacing: 4)),
            const SizedBox(height: 28),
            SizedBox(
              width: 26, height: 26,
              child: CircularProgressIndicator(strokeWidth: 2.4, color: AppColors.card),
            ),
          ],
        ),
      ),
    );
  }
}
