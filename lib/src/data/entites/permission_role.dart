import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum PermissionRole {
  /// User has logged in
  user('USER'),

  /// User has not logged in yet
  guest('GUEST');

  const PermissionRole(this.value);
  final String value;
}
