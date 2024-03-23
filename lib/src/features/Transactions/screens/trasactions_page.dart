import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopapp/src/components/appbar.dart';
import 'package:shopapp/src/features/Transactions/widget/transaction_card.dart';

import '../../../core/core.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<TransactionStatus> statuses = [
      TransactionStatus.shipping,
      TransactionStatus.success,
      TransactionStatus.notPaid,
    ];
    return Scaffold(
      backgroundColor: AppColors.ash,
      appBar: const SHAppBar(
        actionConfig: AppBarActionConfig.allActions,
        actionColor: AppColors.black,
        title: 'Transaction',
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                TabBar(
                    labelPadding: EdgeInsets.zero,
                    labelColor: AppColors.primaryColor,
                    labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600),
                    unselectedLabelColor: AppColors.grey,
                    indicatorColor: AppColors.primaryColor,
                    tabs: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.grey, width: 1))),
                              child: const Tab(
                                text: 'All Transactions',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.grey, width: 1))),
                              child: const Tab(
                                text: 'Shipping',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.grey, width: 1))),
                            child: const Tab(
                              text: 'Not Paid',
                            ),
                          ),
                        ),
                      ]),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColors.grey, width: 1))),
                              child: const Tab(
                                text: 'Success',
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                AutoScaleTabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Details Tab View
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: statuses.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 13.h),
                          itemBuilder: (context, index) {
                            final status = statuses[index];
                            return TransactionCard(status: status);
                          },
                        )),
                    // Reviews Tab View
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          children: [],
                        )),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          children: [],
                        )),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          children: [],
                        )),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
