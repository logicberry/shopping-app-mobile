import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/src/components/navitem.dart';

import '../core/core.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedItemIndex = 0;

  void selectItem(int index) {
    setState(() {
      selectedItemIndex = index;
    });

    switch (index) {
      case 0:
        context.pushNamed(RouteConstants.home);
        break;
      case 1:
        // context.pushNamed(RouteConstants.signIn);
        break;
      case 2:
        // Navigator.pushNamed(context, StorageDetailsScreen.routeName);

        break;
      case 3 || 4 || 6:
        // context.pushNamed("/m");

        break;
      case 5:
        // Navigator.pushNamed(context, SettingsScreen.routeName);

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.white,
        width: 290.w,
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(ImagePath.logo),
                    IconButton(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Balance',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                    // color: AppColors.grey,
                                    )),
                        Space.height(5),
                        Text('\$809.10',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: AppColors.primaryColor,
                                )),
                      ],
                    ),
                    const Divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('My Reward Point',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                    // color: AppColors.grey,
                                    )),
                        Space.height(5),
                        Text('800',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: AppColors.secondaryColor,
                                )),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          NavItem(
            navIcon: SvgPath.home,
            text: 'Dashboard',
            isSelected: selectedItemIndex == 0,
            onTap: () => selectItem(0),
          ),
          NavItem(
            navIcon: SvgPath.seller,
            text: 'Become Seller',
            isSelected: selectedItemIndex == 1,
            onTap: () => selectItem(1),
          ),
          NavItem(
            navIcon: SvgPath.help,
            text: 'Help Center',
            isSelected: selectedItemIndex == 2,
            onTap: () => selectItem(2),
          ),
          NavItem(
            navIcon: SvgPath.categories,
            text: 'Categories',
            isSelected: selectedItemIndex == 3,
            onTap: () => selectItem(3),
          ),
          NavItem(
            navIcon: SvgPath.all,
            text: 'All Products',
            isSelected: selectedItemIndex == 4,
            onTap: () => selectItem(4),
          ),
          NavItem(
            navIcon: SvgPath.profile,
            text: 'New Release',
            isSelected: selectedItemIndex == 5,
            onTap: () => selectItem(5),
          ),
          NavItem(
            navIcon: SvgPath.promo,
            text: 'Promotion',
            isSelected: selectedItemIndex == 6,
            onTap: () => selectItem(6),
          ),
          NavItem(
            navIcon: SvgPath.settings,
            text: 'Settings',
            isSelected: selectedItemIndex == 7,
            onTap: () => selectItem(7),
          ),
          Space.height(50),
          ListTile(
              minLeadingWidth: 0,
              contentPadding: const EdgeInsets.only(left: 40),
              leading: SvgPicture.asset(
                SvgPath.logout,
                colorFilter:
                    const ColorFilter.mode(AppColors.red, BlendMode.srcIn),
              ),
              title: const Text('Logout')),
        ]));
  }
}
