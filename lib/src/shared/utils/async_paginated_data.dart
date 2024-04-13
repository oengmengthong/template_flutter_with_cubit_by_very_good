import 'async_data.dart';

class AsyncPaginatedData<T> extends AsyncData<List<T>> {
  const AsyncPaginatedData({
    super.data,
    this.page = 0,
    this.limit = 10,
    super.error,
    super.loading = false,
    this.hasMore = true,
  });

  final int page;
  final int limit;
  final bool hasMore;

  @override
  AsyncPaginatedData<T> copyWith({
    List<T>? data,
    int? page,
    int? limit,
    dynamic error,
    bool? loading = false,
    bool? hasMore = true,
  }) {
    return AsyncPaginatedData<T>(
      data: data ?? this.data,
      page: page ?? this.page,
      limit: limit ?? this.limit,
      error: error ?? this.error,
      loading: loading ?? this.loading,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
