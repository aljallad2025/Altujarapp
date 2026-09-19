import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('تم استلام طلبك', 'طلب #BH-2025-1841 قيد المراجعة الآن', 'قبل ساعتين'),
      ('بانتظار الدفع', 'طلب #BH-2025-1790 يحتاج دفع الرسوم', 'أمس'),
      ('اكتمل الطلب', 'تم تجديد سجلك التجاري بنجاح', '2 يوليو 2025'),
    ];
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, i) {
        final it = items[i];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border, width: 1.3),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Text(it.$3, style: TextStyle(fontSize: 10, color: AppColors.navGray)),
              const Spacer(),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(it.$1, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: AppColors.text)),
                    const SizedBox(height: 4),
                    Text(it.$2, textAlign: TextAlign.right, style: TextStyle(fontSize: 11.5, color: AppColors.navGray)),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 36, height: 36,
                decoration: BoxDecoration(color: AppColors.card.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.notifications_rounded, color: AppColors.card, size: 18),
              ),
            ],
          ),
        );
      },
    );
  }
}
