class AsyncData<T> {
  const AsyncData({
    this.data,
    this.error,
    this.loading = false,
  });

  final T? data;
  final dynamic error;
  final bool loading;

  T get requireData {
    if (data == null) throw Exception('data is required');
    return data!;
  }

  bool get hasData => data != null;
  bool get hasError => error != null;

  AsyncData<T> copyWith({
    T? data,
    dynamic error,
    bool? loading = false,
  }) {
    return AsyncData<T>(
      data: data ?? this.data,
      error: error ?? this.error,
      loading: loading ?? this.loading,
    );
  }
}
