import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/core.dart';

class NavItem extends StatelessWidget {
  final String text, navIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.navIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 36,
      dense: true,
      onTap: onTap,
      title: Row(
        children: [
          SvgPicture.asset(
            navIcon,
            colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primaryColor : Colors.grey,
                BlendMode.srcIn),
          ),
          Space.width(20),
          Text(text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isSelected ? AppColors.primaryColor : Colors.grey,
                  fontWeight: FontWeight.w500)),
        ],
      ),
      leading: Container(
        height: 33,
        width: 4,
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
      ),
    );
  }
}
