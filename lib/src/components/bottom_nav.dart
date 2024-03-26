import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/src/components/appbar.dart';
import 'package:shopapp/src/components/sidenav.dart';
import 'package:shopapp/src/features/home/screens/home.dart';

import '../core/core.dart';
import '../features/Feeds/screens/feed_screen.dart';
import '../features/Profile/screens/profile_page.dart';
import '../features/Transactions/screens/trasactions_page.dart';

class NavBar extends StatefulWidget {
  static const String routeName = '/nav';
  final int? current;
  const NavBar({
    Key? key,
    this.current,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int? _currentPageIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.current ?? 0;
    _pageController = PageController(initialPage: _currentPageIndex!);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> pages = [
    const HomePage(),
    const FeedsPage(),
    const TransactionsPage(),
    const ProfilePage(),
  ];

  final List<String> pageTitles = [
    'Home',
    'Feeds',
    'Transactions',
    'My Profile'
  ];

  void updatePage(int page) {
    setState(() {
      _currentPageIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ash,
      key: _scaffoldKey,
      appBar: SHAppBar(
        title: pageTitles[_currentPageIndex!],
        ontap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        actionConfig: AppBarActionConfig.allActions,
        background: AppColors.primaryColor,
        actionColor: AppColors.white,
      ),
      drawer: const SideMenu(),
      body: PageView(
        controller: _pageController,
        onPageChanged: updatePage,
        children: pages,
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 0.5)),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedFontSize: 12,
              unselectedFontSize: 11,
              currentIndex: _currentPageIndex!,
              selectedIconTheme:
                  const IconThemeData(color: AppColors.primaryColor),
              selectedItemColor: AppColors.secondaryColor,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.transparent,
              iconSize: 30,
              onTap: (index) {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              },
              items: [
                // HOME
                _buildBottomNavigationBarItem(
                  SvgPath.home,
                  'Home',
                ),
                _buildBottomNavigationBarItem(
                  SvgPath.feeds,
                  'Feeds',
                ),
                _buildBottomNavigationBarItem(
                  SvgPath.transactions,
                  'Transactions',
                ),
                // ACCOUNT
                _buildBottomNavigationBarItem(
                  SvgPath.profile,
                  'My Profile',
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: -2,
            left: MediaQuery.of(context).size.width / 4 * _currentPageIndex!,
            child: Container(
              height: 2,
              width: MediaQuery.of(context).size.width / 4,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String svgPath,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(svgPath),
      activeIcon: SvgPicture.asset(
        svgPath,
        colorFilter:
            const ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
      ),
      label: label,
    );
  }
}
