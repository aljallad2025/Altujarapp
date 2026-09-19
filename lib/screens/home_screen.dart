import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/egov_card.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<String> onNavigate;
  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top bar
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('التّجـار',
                        style: GoogleFonts.cairo(
                          fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.card, height: 1)),
                    const SizedBox(height: 3),
                    Text('ALTUJAR™',
                        style: TextStyle(
                          fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.gold, letterSpacing: 2.5)),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => onNavigate('account'),
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: AppColors.card,
                        child: Image.asset('assets/icons/nav_account.png', width: 16, height: 16, color: Colors.white, colorBlendMode: BlendMode.srcIn),
                      ),
                    ),
                    const SizedBox(width: 14),
                    GestureDetector(
                      onTap: () => onNavigate('alerts'),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset('assets/icons/nav_alerts.png', width: 23, height: 23, color: AppColors.card, colorBlendMode: BlendMode.srcIn),
                          Positioned(
                            top: -1, left: -1,
                            child: Container(
                              width: 7, height: 7,
                              decoration: BoxDecoration(
                                color: const Color(0xFFD93A2B),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 1.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Greeting + Search
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border, width: 1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: const Color(0xFF143C5A).withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 3)),
                ],
              ),
              child: Column(
                children: [
                  Text('مرحبًا بك، عبدالله السلمان',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.text)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border, width: 1.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('ابحث عن خدمة...',
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 13, color: AppColors.navGray)),
                        ),
                        const SizedBox(width: 8),
                        Icon(Icons.search, size: 17, color: AppColors.navGray),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Quick actions 2x2
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.35,
              children: [
                QuickActionCard(iconAsset: 'assets/icons/icon_services.png', label: 'الخدمات', onTap: () => onNavigate('services')),
                QuickActionCard(iconAsset: 'assets/icons/icon_requests.png', label: 'طلباتي', onTap: () => onNavigate('requests')),
                QuickActionCard(iconAsset: 'assets/icons/icon_documents.png', label: 'المستندات', onTap: () => onNavigate('requests')),
                QuickActionCard(iconAsset: 'assets/icons/icon_payments.png', label: 'المدفوعات', onTap: () => onNavigate('requests')),
              ],
            ),
          ),

          // E-services
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
            child: Column(
              children: [
                Text('الخدمات الإلكترونية',
                    style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w800, color: AppColors.text)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: EgovCard(
                        iconAsset: 'assets/icons/icon_licenses.png',
                        title: 'التراخيص والتصاريح',
                        sub: 'التراخيص والتصاريح - المنانية',
                        onTap: () => onNavigate('services'),
                      ),
                    ),
                    const SizedBox(width: 9),
                    Expanded(
                      child: EgovCard(
                        iconAsset: 'assets/icons/icon_registry.png',
                        title: 'السجل التجاري',
                        sub: 'السجل التجاري في الخدمات الشاملة',
                        onTap: () => onNavigate('services'),
                      ),
                    ),
                    const SizedBox(width: 9),
                    Expanded(
                      child: EgovCard(
                        iconAsset: 'assets/icons/icon_foundation.png',
                        title: 'التأسيس والتسجيل',
                        sub: 'التأسيس والتسجيل - المنانية',
                        onTap: () => onNavigate('services'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
