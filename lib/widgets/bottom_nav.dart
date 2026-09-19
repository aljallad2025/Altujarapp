import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class NavItem {
  final String id;
  final String label;
  final String iconAsset;
  const NavItem(this.id, this.label, this.iconAsset);
}

const List<NavItem> navItems = [
  NavItem('home', 'الرئيسية', 'assets/icons/nav_home.png'),
  NavItem('services', 'الخدمات', 'assets/icons/nav_services.png'),
  NavItem('requests', 'طلباتي', 'assets/icons/nav_requests.png'),
  NavItem('alerts', 'الإشعارات', 'assets/icons/nav_alerts.png'),
  NavItem('account', 'حسابي', 'assets/icons/nav_account.png'),
];

class BottomNav extends StatelessWidget {
  final String current;
  final ValueChanged<String> onSelect;

  const BottomNav({super.key, required this.current, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F283C).withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 10, bottom: 9),
      child: Row(
        children: navItems.map((n) {
          final active = current == n.id;
          final color = active ? AppColors.gold : const Color(0xFFCBB98A);
          return Expanded(
            child: InkWell(
              onTap: () => onSelect(n.id),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Opacity(
                    opacity: active ? 1.0 : 0.85,
                    child: Image.asset(n.iconAsset, width: 24, height: 24, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    n.label,
                    style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w700, color: color),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
