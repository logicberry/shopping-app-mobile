import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/src/features/Profile/controller/theme_controller.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SHAppBar(
          actionConfig: AppBarActionConfig.none,
          title: 'Change Theme',
          background: AppColors.primaryColor,
          actionColor: AppColors.white,
          centerTitle: true,
          implyLeading: true,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Change Theme'),
              Switch(
                value: context.watch<ThemeProvider>().currentTheme ==
                    AppTheme.darkTheme,
                onChanged: (v) => context.read<ThemeProvider>().toggleTheme(),
                activeColor: AppColors.primaryColor,
                inactiveTrackColor: AppColors.grey,
              )
            ],
          ),
        )));
  }
}
