import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/core.dart';
import '../widget/widgets.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<TransactionStatus> statuses = [
      TransactionStatus.shipping,
      TransactionStatus.success,
      TransactionStatus.notPaid,
    ];
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            TabBar(
                labelPadding: EdgeInsets.zero,
                labelColor: AppColors.primaryColor,
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w600),
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
                // All Transactions TabView
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: statuses.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 13.h),
                      itemBuilder: (context, index) {
                        final status = statuses[index];
                        return TransactionCard(
                            status: status,
                            onTap: () => bottomSheet(
                                context: context,
                                screen: SizedBox(
                                  height: 600.h,
                                  child: const Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [Text('Receipt Number')],
                                    ),
                                  ),
                                )));
                      },
                    )),
                // Shipping Tab View
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [],
                    )),
                // NotPaid Tab View
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [],
                    )),
                // Sucess Tab View
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
