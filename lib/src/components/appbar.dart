import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/core.dart';

class SHAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool implyLeading, action, centerTitle;
  final void Function()? ontap;
  final Color? background;
  const SHAppBar({
    Key? key,
    this.title,
    this.centerTitle = false,
    this.action = false,
    this.implyLeading = false,
    this.ontap, this.background,
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
                onPressed: ontap ?? () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios,
                    color: AppColors.primaryColor),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SvgPicture.asset(SvgPath.menu),
              ),
        actions: action
            ? [
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      SvgPath.message,
                    )),
                Space.width(20),
                GestureDetector(
                    onTap: () {}, child: SvgPicture.asset(SvgPath.cart)),
                Space.width(20),
                GestureDetector(
                    onTap: () {}, child: SvgPicture.asset(SvgPath.cart)),
                Space.width(20),
              ]
            : null);
  }
}
