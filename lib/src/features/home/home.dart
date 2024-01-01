import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopapp/src/components/appbar.dart';

import '../../core/core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SHAppBar(
          title: 'Home',
          action: true,
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Column(
                children: [
                  Space.height(20),
                  Row(
                    children: [
                      Space.width(20),
                      SvgPicture.asset(SvgPath.location),
                      Space.width(10),
                      Text('St 394 Jackson, New york  United Status',
                          style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
