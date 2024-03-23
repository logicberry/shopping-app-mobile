import 'package:flutter/material.dart';
import 'package:shopapp/src/components/appbar.dart';

import '../../../core/core.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ash,
      appBar: const SHAppBar(
        actionConfig: AppBarActionConfig.allActions,
        implyLeading: true,
        actionColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Container(
            
          )],
        ),
      ),
    );
  }
}
