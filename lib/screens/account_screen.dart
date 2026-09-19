import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rows = [
      (Icons.notifications_active_rounded, 'إشعارات واتساب', 'مفعّل'),
      (Icons.mail_rounded, 'إشعارات البريد', 'مفعّل'),
      (Icons.language_rounded, 'اللغة', 'العربية'),
      (Icons.lock_rounded, 'تغيير كلمة المرور', ''),
      (Icons.support_agent_rounded, 'الدعم والمساعدة', ''),
      (Icons.logout_rounded, 'تسجيل الخروج', ''),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 90),
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('أحمد محمد', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: AppColors.text)),
                const SizedBox(height: 3),
                Text('CR: 12345-1', style: TextStyle(fontSize: 11, color: AppColors.navGray)),
              ],
            ),
            const Spacer(),
            CircleAvatar(radius: 26, backgroundColor: AppColors.card, child: const Icon(Icons.person, color: Colors.white, size: 26)),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(border: Border.all(color: AppColors.border, width: 1.3), borderRadius: BorderRadius.circular(14)),
          child: Column(
            children: rows.asMap().entries.map((e) {
              final row = e.value;
              final last = e.key == rows.length - 1;
              final isLogout = row.$1 == Icons.logout_rounded;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(border: last ? null : Border(bottom: BorderSide(color: AppColors.border))),
                child: Row(
                  children: [
                    if (row.$3.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                        decoration: BoxDecoration(color: const Color(0xFF059669).withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
                        child: Text(row.$3, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xFF059669))),
                      )
                    else
                      Icon(Icons.chevron_left, color: AppColors.navGray, size: 18),
                    const Spacer(),
                    Text(row.$2, style: TextStyle(fontSize: 13, fontWeight: isLogout ? FontWeight.w700 : FontWeight.w500, color: isLogout ? const Color(0xFFDC2626) : AppColors.text)),
                    const SizedBox(width: 12),
                    Icon(row.$1, size: 18, color: isLogout ? const Color(0xFFDC2626) : AppColors.card),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Text('منصة التجار البحرين v1.0 · Altujar.bh', style: TextStyle(fontSize: 10.5, color: AppColors.navGray)),
        ),
      ],
    );
  }
}
