import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yo_panel/config/theme/app_colors.dart';
import 'package:yo_panel/core/widgets/marquee_widget.dart';
import 'package:yo_panel/core/widgets/responsive.dart';
import 'package:yo_panel/features/dashboard/presentation/widgets/column_chart_widget.dart';
import 'package:yo_panel/features/dashboard/presentation/widgets/notification_page_view.dart';
import 'package:yo_panel/features/dashboard/presentation/widgets/wallet_info_card_widget.dart';



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: Responsive(
                      mobile: const WalletInfoCardGridView(crossAxisCount: 2),
                      desktop: const WalletInfoCardGridView(crossAxisCount: 4),
                      tablet: WalletInfoCardGridView(
                          crossAxisCount: width >= 830 ? 4 : 2),
                    ),
                  )
                ],
              ),
              const Gap(20),
              const Responsive(
                mobile: ColumnChartWidget(
                  itemHeight: 350,
                ),
                desktop: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ColumnChartWidget(
                        itemHeight: 350,
                      ),
                    ),
                    Gap(20),
                    Expanded(
                      child: DashboardNotificationPageView(
                        itemHeight: 350,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              if (!isDesktop)
                const DashboardNotificationPageView(
                  itemHeight: 250,
                ),
              if (isDesktop)
                Row(
                  children: <Widget>[
                    Expanded(
                      child: _getTransActionList(),
                    ),
                    const Gap(20),
                    Expanded(
                      child: _getTicketList(),
                    ),
                  ],
                )
              else
                Column(
                  children: <Widget>[
                    const Gap(20),

                    _getTransActionList(),
                    const Gap(20),
                    _getTicketList(),
                  ],
                ),
              const Gap(50)
            ],
          ),
        ),
      ),
    );
  }

  Container _getTransActionList() {
    return Container(
      decoration: BoxDecoration(

        color: AppColor.darkCardBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.only(top: 0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تراکنش ها',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 1500,
              smRatio: 0.75,
              lmRatio: 1.5,
              headingTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IranSans'),
              dataTextStyle:
              const TextStyle(color: Colors.white, fontFamily: 'IranSans'),
              columns: const [
                DataColumn2(
                    size: ColumnSize.M,
                    numeric: true,
                    label: Text('شماره تراکنش'),
                    fixedWidth: 80),
                DataColumn2(
                    size: ColumnSize.L, label: Text('مبلغ'), fixedWidth: 180),
                DataColumn2(
                    size: ColumnSize.L,
                    label: Text('تاریخ'),
                    fixedWidth: 220),
                DataColumn2(
                    size: ColumnSize.L, label: Text('وضعیت'), fixedWidth: 100),

                DataColumn2(
                    size: ColumnSize.L, label: Text('عملیات'), fixedWidth: 80),
              ],
              rows: List.generate(
                10,
                    (index) => DataRow2(
                  cells: [
                    DataCell(MarqueeWidget(
                        child: Text(Random.secure().nextInt(100).toString()))),
                    const DataCell(
                      MarqueeWidget(
                        child: Text(
                          '2,500,000 تومان',
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const DataCell(Text(
                      '25 آبان 1402 ساعت 22:30',
                      maxLines: 1,
                    )),

                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: const FittedBox(
                          child: Text(
                            'تایید شد',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                    DataCell(Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Tooltip(
                            message: 'مشاهده جزییات',
                            decoration: BoxDecoration(color: Colors.black),
                            child: Icon(Icons.open_in_new_rounded,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _getTicketList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(

        color: AppColor.darkCardBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تیکت ها',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Gap(20),
          Flexible(
            fit: FlexFit.tight,
            child: DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 1500,
              smRatio: 0.75,
              lmRatio: 1.5,
              headingTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'IranSans'),
              dataTextStyle:
                  const TextStyle(color: Colors.white, fontFamily: 'IranSans'),

              // minWidth: 200,
              // columnSpacing: 0,
              // horizontalMargin: 0,

              columns: const [
                DataColumn2(
                    size: ColumnSize.M,
                    numeric: true,
                    label: Text('شماره تیکت'),
                    fixedWidth: 80),
                DataColumn2(
                    size: ColumnSize.L, label: Text('موضوع'), fixedWidth: 220),
                DataColumn2(
                    size: ColumnSize.L, label: Text('تاریخ'), fixedWidth: 220),
                DataColumn2(
                    size: ColumnSize.L,
                    label: Text('آخرین بروزرسانی'),
                    fixedWidth: 220),
                DataColumn2(
                    size: ColumnSize.L, label: Text('وضعیت'), fixedWidth: 100),
                DataColumn2(
                    size: ColumnSize.L, label: Text('عملیات'), fixedWidth: 100),
              ],
              rows: List.generate(
                10,
                (index) => DataRow2(
                  cells: [
                    DataCell(MarqueeWidget(
                        child: Text(Random.secure().nextInt(100).toString()))),
                    const DataCell(
                      MarqueeWidget(
                        child: Text(
                          'افزایش موجودی کیف پول پنل',
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const DataCell(
                      Text(
                        '25 آبان 1402 ساعت 20:30',
                        maxLines: 1,
                      ),
                    ),
                    const DataCell(Text(
                      '25 آبان 1402 ساعت 22:30',
                      maxLines: 1,
                    )),
                    DataCell(
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: const FittedBox(
                          child: Text(
                            'پاسخ داده شد',
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    DataCell(Row(
                      children: [
                        InkWell(
                            onTap: () {},
                            child: const Tooltip(
                                message: 'بستن تیکت',
                                decoration: BoxDecoration(color: Colors.black),
                                child: Icon(Icons.close_rounded,
                                    color: Colors.red))),
                        const Gap(20),
                        InkWell(
                          onTap: () {},
                          child: const Tooltip(
                            message: 'مشاهده تیکت',
                            decoration: BoxDecoration(color: Colors.black),
                            child: Icon(Icons.open_in_new_rounded,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
