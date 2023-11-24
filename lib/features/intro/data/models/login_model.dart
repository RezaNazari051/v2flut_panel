import 'package:json_annotation/json_annotation.dart';
import 'package:yo_panel/features/intro/domain/entities/login_data_entity.dart';

part 'login_model.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class LoginModel extends LoginDataEntity {
  @JsonKey(name: 'Role')
  final int role;
  @JsonKey(name: 'Token')
  final String token;

  const LoginModel({required this.role, required this.token})
      : super(token: token, role: role);

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
