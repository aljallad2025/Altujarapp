import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/requests_data.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  Color _statusColor(ReqStatus s) {
    switch (s) {
      case ReqStatus.done: return const Color(0xFF059669);
      case ReqStatus.pendingPayment: return const Color(0xFFD97706);
      case ReqStatus.processing: return AppColors.card;
    }
  }

  String _statusLabel(ReqStatus s) {
    switch (s) {
      case ReqStatus.done: return 'مكتمل';
      case ReqStatus.pendingPayment: return 'بانتظار الدفع';
      case ReqStatus.processing: return 'جارٍ التنفيذ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
      children: mockRequests.map((r) {
        final color = _statusColor(r.status);
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border, width: 1.4),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 2))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(20)),
                    child: Text(_statusLabel(r.status), style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color)),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(r.type, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: AppColors.text)),
                      const SizedBox(height: 3),
                      Text('#${r.id}', style: TextStyle(fontSize: 10.5, color: AppColors.navGray)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: List.generate(r.total, (i) {
                  final filled = i < r.step;
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: EdgeInsets.only(left: i == r.total - 1 ? 0 : 3),
                      decoration: BoxDecoration(
                        color: filled ? color : AppColors.border,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(r.amount, style: TextStyle(color: AppColors.gold, fontWeight: FontWeight.w800, fontSize: 12)),
                  const Spacer(),
                  Text('المرحلة ${r.step} من ${r.total}', style: TextStyle(fontSize: 10.5, color: AppColors.navGray)),
                ],
              ),
              if (r.status == ReqStatus.pendingPayment) ...[
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  decoration: BoxDecoration(color: const Color(0xFF059669), borderRadius: BorderRadius.circular(10)),
                  child: const Text('💳 ادفع الآن', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12.5)),
                ),
              ],
            ],
          ),
        );
      }).toList(),
    );
  }
}
