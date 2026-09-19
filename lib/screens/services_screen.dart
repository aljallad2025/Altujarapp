import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/services_data.dart';

class ServicesScreen extends StatefulWidget {
  final ValueChanged<String>? onNavigate;
  const ServicesScreen({super.key, this.onNavigate});
  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String? openId;
  String search = '';

  @override
  Widget build(BuildContext context) {
    final visible = serviceCategories
        .where((c) =>
            c.title.contains(search) ||
            c.sub.any((s) => s.name.contains(search)))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border, width: 1.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              textAlign: TextAlign.right,
              onChanged: (v) => setState(() => search = v),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'ابحث عن خدمة...',
                hintStyle: TextStyle(color: AppColors.navGray, fontSize: 13),
                suffixIcon: Icon(Icons.search, color: AppColors.navGray, size: 18),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 90),
            itemCount: visible.length,
            itemBuilder: (context, index) {
              final c = visible[index];
              final isOpen = openId == c.id;
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isOpen ? AppColors.card : AppColors.border,
                    width: 1.4,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          openId = isOpen ? null : c.id;
                        });
                      },
                      borderRadius: BorderRadius.circular(14),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.card.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(c.icon, color: AppColors.card, size: 22),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    c.title,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14,
                                      color: AppColors.text,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${c.sub.length} خدمة فرعية',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 11, color: AppColors.navGray),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              isOpen ? Icons.expand_less : Icons.expand_more,
                              color: AppColors.navGray,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isOpen)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: c.sub.asMap().entries.map((entry) {
                          final s = entry.value;
                          final isLast = entry.key == c.sub.length - 1;
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              border: isLast
                                  ? null
                                  : Border(top: BorderSide(color: AppColors.border)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  s.name,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.text,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => widget.onNavigate?.call('requests'),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                        decoration: BoxDecoration(
                                          gradient: AppColors.cardGradient,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Text(
                                          'اطلب',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        _pill(s.fee, AppColors.gold),
                                        const SizedBox(width: 6),
                                        _pill('⏱ ${s.time}', AppColors.card),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _pill(String text, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w700, color: color),
        ),
      );
}
