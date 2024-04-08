import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/src/components/button.dart';
import 'package:shopapp/src/components/textfield.dart';
import 'package:shopapp/src/core/core.dart';

import '../../../services/locator_service.dart';
import '../controller/auth_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();
  final AuthProvider authProvider = locator<AuthProvider>();
  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    super.dispose();
  }

  void _signIn() {
    if (_signInKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      authProvider.login(
        context: context,
        email: email,
        password: password,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(children: [
        Column(children: [
          Container(
              height: 380.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                image: DecorationImage(
                    image: AssetImage(
                      ImagePath.welcome,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space.height(75),
                      Text('Welcome', style: theme.textTheme.headlineLarge),
                      Text('Sign in to Continue',
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(color: AppColors.white))
                    ]),
              )),
        ]),
        Positioned(
            top: 297.h,
            child: Container(
              height: 527.h,
              width: 375.w,
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r)),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 27.0.w, vertical: 35.h),
                child: Form(
                  key: _signInKey,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SATextField(
                        controller: _emailController,
                        hintText: 'Your Email Address',
                        labeltext: 'Your Email Address',
                        inputType: TextInputType.emailAddress,
                      ),
                      Space.height(37),
                      SATextField(
                        controller: _passwordController,
                        isPassword: true,
                        hintText: 'Password',
                        labeltext: 'Password',
                        inputType: TextInputType.emailAddress,
                      ),
                      Space.height(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 18,
                                width: 18,
                                child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    side: const BorderSide(
                                        width: 0.5, color: AppColors.grey),
                                    value: true,
                                    activeColor: AppColors.primaryColor,
                                    onChanged: (v) {}),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text('Remember me',
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text('Forgot Password?',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: AppColors.secondaryColor,
                                )),
                          )
                        ],
                      ),
                      Space.height(71),
                      SAActionButton(
                        title: 'Sign In',
                        onTap: _signIn,
                      ),
                      Space.height(80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: theme.textTheme.bodyLarge,
                          ),
                          Space.width(8),
                          GestureDetector(
                              onTap: () {
                                context.pushNamed(RouteConstants.signUp);
                              },
                              child: Text(
                                'Sign Up',
                                style: theme.textTheme.bodyLarge
                                    ?.copyWith(color: AppColors.secondaryColor),
                              ))
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
