import 'package:flutter/material.dart';
import 'package:shopapp/src/components/appbar.dart';

import '../../../core/core.dart';
import '../widget/nofication_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const SHAppBar(
        actionConfig: AppBarActionConfig.none,
        title: 'Notifications',
        centerTitle: true,
        implyLeading: true,
        actionColor: AppColors.white,
        background: AppColors.primaryColor,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 7,
            separatorBuilder: (context, index) => const Divider(
              thickness: 1,
            ),
            itemBuilder: (context, index) {
              return const NotificationCard(
                  type: NotificationType.paymentSuccessful);
            },
          )),
    );
  }
}
