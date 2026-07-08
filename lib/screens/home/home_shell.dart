import 'package:flutter/material.dart';
import '../../services/progress_service.dart';
import '../../widgets/animations/xp_counter.dart';
import '../../widgets/nav/app_nav_bar.dart';
import '../../widgets/common/screen_scaffold.dart';
import 'home_screen.dart';
import '../courses/courses_screen.dart';
import '../tools/tools_screen.dart';
import '../community/community_screen.dart';
import '../profile/profile_screen.dart';

/// The main tabbed shell hosting the five primary destinations behind a
/// floating frosted glass navigation bar.
class HomeShell extends StatefulWidget {
  final int initialIndex;
  const HomeShell({super.key, this.initialIndex = 0});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  late int _index = widget.initialIndex;

  static const _items = [
    NavItem(Icons.home_rounded, 'Home'),
    NavItem(Icons.menu_book_rounded, 'Courses'),
    NavItem(Icons.build_rounded, 'Tools'),
    NavItem(Icons.groups_rounded, 'Community'),
    NavItem(Icons.person_rounded, 'Profile'),
  ];

  @override
  void initState() {
    super.initState();
    // Advance the streak and award any streak bonuses on app open.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final bonus = await ProgressService.instance.registerAppOpen();
      if (bonus > 0 && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Row(
              children: [
                const Icon(Icons.local_fire_department_rounded,
                    color: Colors.orange),
                const SizedBox(width: 8),
                Text('Streak bonus! '),
                XpGainBadge(amount: bonus),
              ],
            ),
          ),
        );
      }
    });
  }

  void _select(int i) => setState(() => _index = i);

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      extendBody: true,
      bottomNavigationBar: AppNavBar(
        currentIndex: _index,
        onTap: _select,
        items: _items,
      ),
      body: IndexedStack(
        index: _index,
        children: [
          HomeScreen(onNavigate: _select),
          const CoursesScreen(),
          const ToolsScreen(),
          const CommunityScreen(),
          const ProfileScreen(),
        ],
      ),
    );
  }
}
