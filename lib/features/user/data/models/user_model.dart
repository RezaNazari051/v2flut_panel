import 'package:json_annotation/json_annotation.dart';
import 'package:yo_panel/features/user/domain/entities/user_entity.dart';

part 'user_model.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class UserModel extends UserEntity{
  @JsonKey(name: 'result')
  final  List<Result>? result;
  @JsonKey(name: 'total')
  final  int? total;

  const UserModel({this.result, this.total}):
  super(result: result,total: total);

   factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

   Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class Result {
  @JsonKey(name: 'id')
  final  int id;
  @JsonKey(name: 'Name')
  final  String Name;
  @JsonKey(name: 'UsedVolume')
  final  String UsedVolume;
  @JsonKey(name: 'DaysLeft')
  final  int? DaysLeft;
  @JsonKey(name: 'ExpireDate')
  final  String? ExpireDate;
  @JsonKey(name: 'PlanName')
  final  String PlanName;
  @JsonKey(name: 'SubLink')
  final  String SubLink;
  @JsonKey(name: 'RemainingVolume')
  final  String RemainingVolume;
  @JsonKey(name: 'CanEdit')
  final  bool CanEdit;
  @JsonKey(name: 'IsBanned')
  final  bool IsBanned;
  @JsonKey(name: 'TotalVolume')
  final  String TotalVolume;
  @JsonKey(name: 'IsActive')
  final  String IsActive;
  @JsonKey(name: 'IsOnline')
  final  bool IsOnline;
  @JsonKey(name: 'LastTimeOnline')
  final  String? LastTimeOnline;

  Result({required this.id, required this.Name, required this.UsedVolume, this.DaysLeft, this.ExpireDate, required this.PlanName, required this.SubLink, required this.RemainingVolume, required this.CanEdit, required this.IsBanned, required this.TotalVolume, required this.IsActive, required this.IsOnline, this.LastTimeOnline});

   factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

   Map<String, dynamic> toJson() => _$ResultToJson(this);
}

