import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_response_model.freezed.dart';
part 'users_response_model.g.dart';

@freezed
abstract class UsersResponseModel with _$UsersResponseModel {
  const factory UsersResponseModel({
    @JsonKey(name: "user_id") required int userId,
    required String username,
    required String email,
    required String password,
  }) = _UsersResponseModel;

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) => _$UsersResponseModelFromJson(json);
}