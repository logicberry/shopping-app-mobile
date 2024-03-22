import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/core.dart';

enum AppBarActionConfig {
  none,
  messageAndNotification,
  allActions,
}

class SHAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool implyLeading, centerTitle;
  final void Function()? ontap;
  final Color? background, actionColor;
  final AppBarActionConfig actionConfig;
  const SHAppBar({
    Key? key,
    this.title,
    this.centerTitle = false,
    this.implyLeading = false,
    this.ontap,
    this.background,
    this.actionColor,
    required this.actionConfig,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: implyLeading,
      elevation: 0,
      titleSpacing: 23,
      backgroundColor: background ?? AppColors.white,
      leadingWidth: 40,
      centerTitle: centerTitle,
      title: Text(title ?? '',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: background != null ? AppColors.white : AppColors.black,
              )),
      leading: implyLeading
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: AppColors.black),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                  onTap: ontap, child: SvgPicture.asset(SvgPath.menu)),
            ),
      actions: _buildActions(context),
    );
  }

  List<Widget>? _buildActions(BuildContext context) {
    switch (actionConfig) {
      case AppBarActionConfig.none:
        return null;
      case AppBarActionConfig.messageAndNotification:
        return [
          _buildActionIcon(SvgPath.message),
          Space.width(20),
          _buildActionIcon(SvgPath.cart),
          Space.width(20),
        ];
      case AppBarActionConfig.allActions:
        return [
          _buildActionIcon(SvgPath.message),
          Space.width(20),
          _buildActionIcon(SvgPath.cart),
          Space.width(20),
          _buildActionIcon(SvgPath.cart),
          Space.width(20),
        ];
    }
  }

  Widget _buildActionIcon(String svgPath) {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(
        svgPath,
        // ignore: deprecated_member_use
        color: actionColor,
      ),
    );
  }
}
