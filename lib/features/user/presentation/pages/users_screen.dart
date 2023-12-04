import 'package:data_grid/data_grid.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:yo_panel/config/theme/app_colors.dart';
import 'package:yo_panel/core/params/get_users_params.dart';
import 'package:yo_panel/features/user/data/models/user_model.dart';
import 'package:yo_panel/features/user/domain/entities/user_entity.dart';
import 'package:yo_panel/features/user/presentation/bloc/get_users_status.dart';
import 'package:yo_panel/features/user/presentation/bloc/user_bloc.dart';

import '../../../../core/utils/dialogs.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late ScrollController scrollController;
  late PlutoGridStateManager stateManager;

  @override
  void initState() {
    BlocProvider.of<UserBloc>(context)
        .add(GetAllUserEvent(GetUsersParams(sortType: 'ASC', page: 8)));

    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final horizontalScrollController = ScrollController();

    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.numpadAdd):VoidCallbackIntent(() {
    AppDialog.showQrCodeDialog(context, content:' content');
    }),

      },
      child: Scaffold(
          body: SelectionArea(
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.usersStatus is GetUserLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            if (state.usersStatus is GetUserCompleted) {
              final GetUserCompleted getUserCompleted =
                  state.usersStatus as GetUserCompleted;
              final UserEntity userEntity = getUserCompleted.userEntity;

              /// columnGroups that can group columns can be omitted.
              final List<PlutoColumnGroup> columnGroups = [
                PlutoColumnGroup(
                    title: 'Id', fields: ['id'], expandedColumn: true),
                PlutoColumnGroup(
                    title: 'User information', fields: ['name', 'age']),
                PlutoColumnGroup(title: 'Status', children: [
                  PlutoColumnGroup(
                      title: 'A', fields: ['role'], expandedColumn: true),
                  PlutoColumnGroup(
                      title: 'Etc.', fields: ['joined', 'working_time']),
                ]),
              ];
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            backgroundColor: Colors.white
                          ),
                          onPressed: (){
                          }, child:const Text('افزودن کاربر')),
                    ),
                    Scrollbar(
                      controller: horizontalScrollController,
                      scrollbarOrientation: ScrollbarOrientation.bottom,
                      thumbVisibility: true,
                      trackVisibility: true,
                      child: SingleChildScrollView(
                        controller: horizontalScrollController,
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          dataRowMinHeight: 80,
                          dataRowMaxHeight: 80,
                          // sortColumnIndex: _sortColumnIndex.value,
                          // sortAscending: _sortAscending.value,
                          // onSelectAll: _dessertsDataSource.selectAll,
                          columns: const [
                            DataColumn(
                              label: Text(
                                'نام کاربر',
                                style: TextStyle(color: Colors.white),
                              ),
                              // onSort: (columnIndex, ascending) =>
                              // _sort<String>((d) => d.name, columnIndex, ascending),
                            ),
                            DataColumn(
                              label:
                                  Text('پلن', style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('زمان باقی مانده(روز)',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('حجم باقی مانده',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('حجم مصرف شده',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('تاریخ انقضا',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('وضعیت',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            DataColumn(
                              label: Text('عملیات',
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                          rows: List.generate(
                            10,
                            (index) {
                              return DataRow(
                                cells: [
                                  DataCell(Tooltip(
                                    message:
                                        'اخرین استفاده: ${userEntity.result![index]?.LastTimeOnline ?? 'تا به حال آنلاین نشده'}',
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 5,
                                          height: 5,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  userEntity.result![index]!.IsOnline
                                                      ? Colors.green
                                                      : Colors.red),
                                        ),
                                        const Gap(10),
                                        Text(userEntity.result![index]!.Name),
                                      ],
                                    ),
                                  )),
                                  DataCell(Center(
                                      child:
                                          Text(userEntity.result![index]!.PlanName))),
                                  DataCell(Center(
                                    child: Text(userEntity.result![index]!.DaysLeft
                                        .toString()),
                                  )),
                                  DataCell(Center(
                                      child: Text(userEntity
                                          .result![index]!.RemainingVolume))),
                                  DataCell(Center(
                                      child: Text(
                                          userEntity.result![index]!.UsedVolume))),
                                  DataCell(Center(
                                    child: Text(userEntity.result![index]!.ExpireDate
                                        .toString()),
                                  )),
                                  DataCell(Center(
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color:
                                                userEntity.result![index]!.IsActive ==
                                                        'فعال'
                                                    ? const Color(0xffddf4ea)
                                                    : const Color(0xfffecaca),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              userEntity.result![index]!.IsActive,
                                              style: TextStyle(
                                                  color: userEntity.result![index]!
                                                              .IsActive ==
                                                          'فعال'
                                                      ? const Color(0xff5b7c68)
                                                      : const Color(0xffdf4446),
                                                  fontSize: 12),
                                            ),
                                          ))
                                      // Tooltip(
                                      //     message: !userEntity.result![index]!.IsBanned?'فعال':'غیرفعال',
                                      //     child: CupertinoSwitch(value: !userEntity.result![index]!.IsBanned, onChanged:(value){},)),
                                      )),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton.filled(
                                            onPressed: () {
                                              AppDialog.showQrCodeDialog(context, content:userEntity.result![index]!.SubLink);

                                            },
                                            icon: const Icon(Icons.qr_code_rounded),
                                            tooltip: 'نمایش qr code'),
                                        const Gap(10),
                                        IconButton.filled(
                                          onPressed: () {},
                                          icon: const Icon(Icons.edit),
                                          tooltip: 'تغییرلینک اشتراک',
                                        ),
                                        const Gap(10),
                                        IconButton.filled(
                                          onPressed: () {},
                                          icon: const Icon(Icons.article),
                                          tooltip: 'مشاهده ریزمصرف کاربر',
                                        ),
                                        const Gap(10),
                                        userEntity.result![index]!.CanEdit
                                            ? IconButton.filled(
                                                onPressed: () {},
                                                icon: const Icon(Icons.exit_to_app),
                                                tooltip: 'تمدید اشتراک',
                                              )
                                            : const SizedBox.shrink(),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state.usersStatus is GetUserError) {
              return Text('Error');
            }
            return Text('data');
          },
        ),
      )),
    );
  }
}

//   }
// }
