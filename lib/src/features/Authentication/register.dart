import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/src/components/button.dart';
import 'package:shopapp/src/components/textfield.dart';
import 'package:shopapp/src/core/core.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static final TextEditingController _nameController = TextEditingController();
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _phoneController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();
      static final TextEditingController _confirmPasswordController = TextEditingController();
  static final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
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
                      Text('Register',
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text('Enter your personal details to create an account',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
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
                        inputType: TextInputType.emailAddress,
                      ),
                      Space.height(30),
                      SATextField(
                        controller: _confirmPasswordController,
                        isPassword: true,
                        hintText: 'Confirm Password',
                        labeltext: 'Confirm Password',
                      ),
                      Space.height(59),
                       SAActionButton(
                        title: 'Sign Up',
                        onTap: () => context.go(RouteConstants.home),

                      ),
                      Space.height(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account?',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Space.width(8),
                          GestureDetector(
                            onTap: () => context.pushNamed(RouteConstants.signIn),
                              child: Text(
                            'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.secondaryColor),
                          ))
                        ],
                      ),
                      Space.height(63)
                    ]),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
