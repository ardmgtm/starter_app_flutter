class AppResponse<T> {
  final bool success;
  final T? data;
  final String? message;

  AppResponse({required this.success, this.data, this.message});
}
