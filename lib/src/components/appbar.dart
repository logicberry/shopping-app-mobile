import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/core.dart';
import '../features/Cart/controller/cart_controller.dart';

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
    super.key,
    this.title,
    this.centerTitle = false,
    this.implyLeading = false,
    this.ontap,
    this.background,
    this.actionColor,
    required this.actionConfig,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cartProvider = context.watch<CartProvider>();
    return AppBar(
      automaticallyImplyLeading: implyLeading,
      elevation: 0,
      titleSpacing: 23,
      backgroundColor: background ?? AppColors.white,
      leadingWidth: 40,
      centerTitle: centerTitle,
      title: Text(title ?? '',
          style: textTheme.labelLarge?.copyWith(
            color: background != null ? AppColors.white : AppColors.black,
          )),
      leading: implyLeading
          ? IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back, color: actionColor),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                  onTap: ontap,
                  child: SvgPicture.asset(
                    SvgPath.menu,
                    colorFilter:
                        ColorFilter.mode(actionColor!, BlendMode.srcIn),
                  )),
            ),
      actions: _buildActions(context, cartProvider.cartItems.length),
    );
  }

  List<Widget>? _buildActions(BuildContext context, int? cartItemCount) {
    switch (actionConfig) {
      case AppBarActionConfig.none:
        return null;
      case AppBarActionConfig.messageAndNotification:
        return [
          _buildActionIcon(svgPath: SvgPath.message),
          Space.width(20),
          _buildActionIcon(svgPath: SvgPath.notification),
          Space.width(20),
        ];
      case AppBarActionConfig.allActions:
        return [
          _buildActionIcon(svgPath: SvgPath.message),
          Space.width(20),
          _buildActionIcon(
            svgPath: SvgPath.notification,
            ontap: () => context.pushNamed(RouteConstants.notification),
          ),
          Space.width(20),
          _buildActionIcon(
              context: context,
              svgPath: SvgPath.cart,
              ontap: () => context.pushNamed(RouteConstants.cart),
              itemCount: cartItemCount),
          Space.width(20),
        ];
    }
  }

  Widget _buildActionIcon(
      {BuildContext? context,
      required String svgPath,
      Function()? ontap,
      int? itemCount}) {
    return Stack(
      children: [
        GestureDetector(
          onTap: ontap,
          child: SvgPicture.asset(
            svgPath,
            color: actionColor,
          ),
        ),
        if (itemCount != null && itemCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 12,
                minHeight: 12,
              ),
              child: Text(
                itemCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
