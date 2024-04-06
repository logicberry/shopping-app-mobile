import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/src/core/core.dart';
import 'package:shopapp/src/features/Authentication/controller/auth_controller.dart';

import '../../../components/components.dart';
import '../../../services/locator_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  AuthProvider authProvider = locator<AuthProvider>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_signUpKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final phone = _phoneController.text;
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      if (password != confirmPassword) {
        Snackbar.show(
            context: context, message: 'Passwords do not match', isError: true);
        return;
      }

      authProvider.register(
        context: context,
        fullName: name,
        email: email,
        phoneNumber: phone,
        password: password,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(children: [
        Column(children: [
          Container(
              height: 161.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                image: DecorationImage(
                    image: AssetImage(
                      ImagePath.register,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space.height(75),
                      Text('Register', style: AppTheme.textTheme.headlineLarge),
                      Text('Enter your personal details to create an account',
                          style: AppTheme.textTheme.bodyLarge
                              ?.copyWith(color: AppColors.white))
                    ]),
              )),
        ]),
        Positioned(
            top: 177.h,
            child: Container(
              height: 669.h,
              width: 375.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r)),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 27.0.w, vertical: 35.h),
                child: Form(
                  key: _signUpKey,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SATextField(
                        controller: _nameController,
                        hintText: 'Full Name',
                        labeltext: 'Full Name',
                        inputType: TextInputType.name,
                      ),
                      Space.height(30),
                      SATextField(
                        controller: _emailController,
                        hintText: 'Email Address',
                        labeltext: 'Email Address',
                        inputType: TextInputType.emailAddress,
                      ),
                      Space.height(30),
                      SATextField(
                        controller: _phoneController,
                        hintText: 'Phone Number',
                        labeltext: 'Phone Number',
                        inputType: TextInputType.phone,
                      ),
                      Space.height(30),
                      SATextField(
                        controller: _passwordController,
                        isPassword: true,
                        hintText: 'Password',
                        labeltext: 'Password',
                        // inputType: TextInputType.visiblePassword,
                      ),
                      Space.height(30),
                      SATextField(
                        controller: _confirmPasswordController,
                        isPassword: true,
                        hintText: 'Confirm Password',
                        labeltext: 'Confirm Password',
                        inputType: TextInputType.visiblePassword,
                      ),
                      Space.height(59),
                      SAActionButton(
                        title: 'Sign Up',
                        onTap: _signUp,
                      ),
                      Space.height(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?',
                            style: AppTheme.textTheme.bodyLarge,
                          ),
                          Space.width(8),
                          GestureDetector(
                              onTap: () =>
                                  context.goNamed(RouteConstants.signIn),
                              child: Text(
                                'Sign In',
                                style: AppTheme.textTheme.bodyLarge
                                    ?.copyWith(color: AppColors.secondaryColor),
                              ))
                        ],
                      ),
                      // Space.height(63)
                    ]),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
