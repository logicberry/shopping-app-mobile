import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/components/appbar.dart';
import 'package:shopapp/src/components/button.dart';
import 'package:shopapp/src/components/textfield.dart';

import '../../../core/core.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SHAppBar(
        actionConfig: AppBarActionConfig.none,
        title: 'Edit Profile',
        centerTitle: true,
        implyLeading: true,
      ),
      backgroundColor: AppColors.ash,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Space.height(30),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 358.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Space.height(50),
                          const SATextField(
                            hintText: 'Full Name',
                          ),
                          Space.height(15),
                          const SATextField(
                            hintText: 'Email Address',
                          ),
                          Space.height(15),
                          const SATextField(
                            hintText: 'Phone Number',
                          ),
                          Space.height(15),
                          const SATextField(
                            hintText: 'Country',
                          ),
                          Space.height(15),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -40,
                    right: 130,
                    child: CircleAvatar(
                      radius: 45.r,
                      backgroundImage: const AssetImage(ImagePath.welcome),
                    ),
                  )
                ],
              ),
              Space.height(20),
              Container(
                height: 110.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Address'),
                      Space.height(10),
                      const Text(
                          'Domen Tikoro Street:  825 Baker Avenue, Dallas,Texas, Zip code  75202')
                    ],
                  ),
                ),
              ),
              Space.height(25),
              SAActionButton(title: 'Save Changes', onTap: () {})
            ],
          ),
        )),
      ),
    );
  }
}
