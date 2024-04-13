import 'package:json_annotation/json_annotation.dart';



@JsonEnum(valueField: 'value')
enum TokenType {
  bearer('Bearer'),
  basic('Basic');

  const TokenType(this.value);
  final String value;
}
