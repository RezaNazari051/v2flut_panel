import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:yo_panel/config/theme/app_colors.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SampleUser> sampleData = List.generate(
        5,
        (index) => SampleUser(
            id: 1,
            name: 'mohammadrezamohammadi',
            plan: '20 گیگ 1 ماهه 70ت',
            usedVolume: '15 گیگ',
            expireDate: '25 آذر 1402',
            remainingVolume: '50 گیگ',
            totalVolume: '20 گیگ',
            isBanned: true,
            isOnline: true));
    final GridDataSource dataSource = GridDataSource(sampleData);
    print('users screen is build');
    return Scaffold(

        body: SfDataGridTheme(
      data: SfDataGridThemeData(gridLineColor: AppColor.grayColor),
      child: SfDataGrid(
          horizontalScrollController: scrollController,
          // defaultCo  lumnWidth: 150,

          gridLinesVisibility: GridLinesVisibility.horizontal,
          headerGridLinesVisibility: GridLinesVisibility.horizontal,
          showHorizontalScrollbar: true,
          showVerticalScrollbar: true,
          columnWidthMode: ColumnWidthMode.fitByCellValue,
          source: dataSource,
          columns: [
            GridColumn(
                width: 100,
                columnName: 'id',
                label: const Center(
                    child: Text(
                  'شماره اکانت',
                  style: TextStyle(color: Colors.white),
                ))),
            GridColumn(
                columnName: 'name',
                label: const Center(
                    child: Text('نام کاربر',
                        style: TextStyle(color: Colors.white)))),
            GridColumn(
                columnName: 'plan',
                label: const Center(
                    child: Text('پلن',
                        style: TextStyle(color: Colors.white)))),
            GridColumn(
                width: 150,
                columnName: 'daysLeft',
                label: const Center(
                    child: Text('زمان باقی مانده (روز)',
                        style: TextStyle(color: Colors.white)))),
            GridColumn(
                width: 150,
                columnName: 'remainingVolume',
                label: const Center(
                    child: Text('حجم باقی مانده',
                        style: TextStyle(color: Colors.white)))),
            GridColumn(
                width: 150,
                columnName: 'usedVolume',
                label: const Center(
                    child: Text('حجم مصرف شده',
                        style: TextStyle(color: Colors.white)))),
            GridColumn(
                width: 150,
                columnName: 'expireDate',
                label: const Center(
                    child: Text('تاریخ انقضا',
                        style: TextStyle(color: Colors.white)))),
            GridColumn(
                columnName: 'isBanned',
                label: const Center(
                    child: Text('وضعیت',
                        style: TextStyle(color: Colors.white)))),
            GridColumn(
                width: 300,
                columnName: 'operation',
                label: const Center(
                    child: Text('عملیات',
                        style: TextStyle(color: Colors.white)))),
            // GridColumn(columnName: 'id', label: Text('عملیات')),
            // DataColumn2(label: Text('شماره اکانت'),),
            // DataColumn2(label: Text('نام کاربر'),),
            // DataColumn2(label: Text('پلن')),
            // DataColumn2(label: Text('زمان باقی مانده (روز)')),
            // DataColumn2(label: Text('حجم باقی مانده')),
            // DataColumn2(label: Text('حجم مصرف شده')),
            // DataColumn2(label: Text('تاریخ انقضا')),
            // DataColumn2(label: Text('وضعیت')),
            // DataColumn2(label: Text('عملیات')),
          ]),
    ));
  }
}

class GridDataSource extends DataGridSource {
  GridDataSource(List<SampleUser> sampleUsers) {
    _users = sampleUsers
        .map((e) => DataGridRow(cells: [
              DataGridCell(columnName: 'id', value: e.id),
              DataGridCell(columnName: 'name', value: e.name),
              DataGridCell(columnName: 'plan', value: e.plan),
              DataGridCell(columnName: 'daysLeft', value: e.daysLeft),
              DataGridCell(
                  columnName: 'remainingVolume', value: e.remainingVolume),
              DataGridCell(columnName: 'usedVolume', value: e.usedVolume),
              DataGridCell(columnName: 'expireDate', value: e.expireDate),
              // DataGridCell(columnName: 'totalVolume', value: e.totalVolume),
              DataGridCell(columnName: 'isBanned', value: e.isBanned),
              DataGridCell(columnName: 'operation', value: e.isBanned),
              // DataGridCell(columnName: 'isOnline', value: e.isOnline),
            ]))
        .toList();
  }

  List<DataGridRow> _users = [];

  @override
  List<DataGridRow> get rows => _users;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    // TODO: implement buildRow
    return DataGridRowAdapter(
        cells: row
            .getCells()
            .map(
              (dataGridCell) {
                if(dataGridCell.columnName=='operation'){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){}, child:Text('کپی لینک',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(backgroundColor: AppColor.grayColor),
                      ),
                      IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.qrcode,color: AppColor.grayColor,),
                      tooltip: 'اسکن qr code',),

                      IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.pen,color: AppColor.grayColor,),
                      tooltip: 'بازنشانی لینک اشتراک',),

                      IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.chart_bar_alt_fill,color: AppColor.grayColor,),
                      tooltip: 'مشاهده جزییات مصرف',),

                    ],
                  );
                }
                else if (dataGridCell.columnName=='isBanned'){
                  return  Center(
                    child: CupertinoSwitch(
                                    value: !dataGridCell.value,
                                    // value: false,
                                    trackColor: Colors.red,
                                    onChanged: (value) {},
                                    ),
                );

                }
                else{
                  return Center(
                    child: Text(
                      dataGridCell.value.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }
                // return dataGridCell.columnName == 'isBanned'
                //   ? Tooltip(
                //       message: !dataGridCell.value ? 'فعال' : 'مسدود',
                //       child: CupertinoSwitch(
                //         value: !dataGridCell.value,
                //         // value: false,
                //         trackColor: Colors.red,
                //         onChanged: (value) {},
                //       ),
                //     )
                //   : Center(
                //       child: Text(
                //         dataGridCell.value.toString(),
                //         style: const TextStyle(color: Colors.white),
                //       ),
                //     );
              },
            )
            .toList());
  }
}

class SampleUser {
  final int id;
  final String name;
  final String plan;
  final int? daysLeft;
  final String usedVolume;
  final String remainingVolume;
  final String totalVolume;
  final String? expireDate;
  final bool isBanned;
  final bool isOnline;

  SampleUser({
    required this.id,
    required this.name,
    required this.plan,
    this.daysLeft,
    required this.usedVolume,
    required this.remainingVolume,
    required this.totalVolume,
    this.expireDate,
    required this.isBanned,
    required this.isOnline,
  });
}
