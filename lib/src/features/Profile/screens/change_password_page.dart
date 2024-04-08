import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';
import '../controller/user_controller.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  void changePassword() {
    final oldPassword = _oldPasswordController.text;
    final newPassword = _newPasswordController.text;
    context.read<UserProvider>().changePassword(
        context: context, oldPassword: oldPassword, newPassword: newPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SHAppBar(
          actionConfig: AppBarActionConfig.none,
          title: 'Change Password',
          background: AppColors.primaryColor,
          actionColor: AppColors.white,
          centerTitle: true,
          implyLeading: true,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: Column(
            children: [
              SATextField(
                hintText: 'Old Password',
                controller: _oldPasswordController,
              ),
              Space.height(15),
              SATextField(
                  hintText: 'New Password', controller: _newPasswordController),
              Space.height(35),
              SAActionButton(title: 'Save', onTap: changePassword)
            ],
          ),
        )));
  }
}
