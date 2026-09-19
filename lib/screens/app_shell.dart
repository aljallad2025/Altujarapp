import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/bottom_nav.dart';
import 'home_screen.dart';
import 'services_screen.dart';
import 'requests_screen.dart';
import 'alerts_screen.dart';
import 'account_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  String tab = 'home';

  Widget _screen() {
    switch (tab) {
      case 'home':
        return HomeScreen(onNavigate: (id) => setState(() => tab = id));
      case 'services':
        return ServicesScreen(onNavigate: (id) => setState(() => tab = id));
      case 'requests':
        return const RequestsScreen();
      case 'alerts':
        return const AlertsScreen();
      case 'account':
        return const AccountScreen();
      default:
        return HomeScreen(onNavigate: (id) => setState(() => tab = id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: SafeArea(child: _screen()),
        bottomNavigationBar: SafeArea(
          top: false,
          child: BottomNav(current: tab, onSelect: (id) => setState(() => tab = id)),
        ),
      ),
    );
  }
}
