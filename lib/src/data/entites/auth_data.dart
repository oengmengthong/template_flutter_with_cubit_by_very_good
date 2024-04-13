import 'package:json_annotation/json_annotation.dart';

part 'auth_data.g.dart';

@JsonSerializable()
class AuthData {
  String accessToken;
  String refreshToken;
  int expireIn;

  AuthData({
    required this.accessToken,
    required this.refreshToken,
    required this.expireIn,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return _$AuthDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}
