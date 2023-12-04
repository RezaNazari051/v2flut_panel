// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'result': instance.result,
      'total': instance.total,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int,
      Name: json['Name'] as String,
      UsedVolume: json['UsedVolume'] as String,
      DaysLeft: json['DaysLeft'] as int?,
      ExpireDate: json['ExpireDate'] as String?,
      PlanName: json['PlanName'] as String,
      SubLink: json['SubLink'] as String,
      RemainingVolume: json['RemainingVolume'] as String,
      CanEdit: json['CanEdit'] as bool,
      IsBanned: json['IsBanned'] as bool,
      TotalVolume: json['TotalVolume'] as String,
      IsActive: json['IsActive'] as String,
      IsOnline: json['IsOnline'] as bool,
      LastTimeOnline: json['LastTimeOnline'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'Name': instance.Name,
      'UsedVolume': instance.UsedVolume,
      'DaysLeft': instance.DaysLeft,
      'ExpireDate': instance.ExpireDate,
      'PlanName': instance.PlanName,
      'SubLink': instance.SubLink,
      'RemainingVolume': instance.RemainingVolume,
      'CanEdit': instance.CanEdit,
      'IsBanned': instance.IsBanned,
      'TotalVolume': instance.TotalVolume,
      'IsActive': instance.IsActive,
      'IsOnline': instance.IsOnline,
      'LastTimeOnline': instance.LastTimeOnline,
    };
