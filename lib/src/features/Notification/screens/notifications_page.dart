import 'package:flutter/material.dart';
import 'package:shopapp/src/components/appbar.dart';

import '../widget/nofication_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SHAppBar(
        actionConfig: AppBarActionConfig.none,
        title: 'Notifications',
        centerTitle: true,
        implyLeading: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
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
