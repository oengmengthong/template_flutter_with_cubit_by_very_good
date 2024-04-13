import 'package:json_annotation/json_annotation.dart';

part 'paginated.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Paginated<T> {
  Paginated({
    List<T>? items,
    this.total = 0,
    required this.limit,
    required this.pageNumber,
    required this.hasMore,
  }) : items = items ?? const [];

  List<T> items;
  int total;
  int limit;
  int pageNumber;
  bool hasMore;

  factory Paginated.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$PaginatedFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) {
    return _$PaginatedToJson(this, toJsonT);
  }
}
