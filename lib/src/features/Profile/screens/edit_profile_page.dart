import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/src/features/Profile/controller/user_controller.dart';
import 'package:shopapp/src/features/Profile/model/user_model.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel user;
  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final GlobalKey<FormState> _editProfileKey = GlobalKey<FormState>();

  @override
  void initState() {
    // Initialize text controllers with user data
    _nameController.text = widget.user.name ?? '';
    _addressController.text = widget.user.address ?? '';
    _phoneController.text = widget.user.phone ?? '';
    _countryController.text = widget.user.country ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  void edit() {
    final name = _nameController.text;
    final phone = _phoneController.text;
    final address = _addressController.text;
    final country = _countryController.text;
    Provider.of<UserProvider>(context, listen: false).editProfile(
        context: context,
        fullName: name,
        phoneNumber: phone,
        address: address,
        country: country);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = context.watch<UserProvider>().user;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const SHAppBar(
        actionConfig: AppBarActionConfig.none,
        title: 'Edit Profile',
        centerTitle: true,
        implyLeading: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _editProfileKey,
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Space.height(50),
                            SATextField(
                              hintText: 'Full Name',
                              controller: _nameController,
                            ),
                            Space.height(15),
                            SATextField(
                              hintText: 'Phone Number',
                              controller: _phoneController,
                            ),
                            Space.height(15),
                            SATextField(
                              hintText: 'Address',
                              controller: _addressController,
                            ),
                            Space.height(15),
                            SATextField(
                              hintText: 'Country',
                              controller: _countryController,
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
                    padding: EdgeInsets.symmetric(
                        horizontal: 25.0.w, vertical: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Address'),
                        Space.height(10),
                        Text('${user.address}, ${user.country}')
                      ],
                    ),
                  ),
                ),
                Space.height(25),
                SAActionButton(title: 'Save Changes', onTap: edit)
              ],
            ),
          ),
        )),
      ),
    );
  }
}
