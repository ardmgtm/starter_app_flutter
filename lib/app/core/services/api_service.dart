import 'package:get/get.dart';

class ApiService extends GetxService {
  final GetConnect _connect = GetConnect();

  Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await _connect.get(url, query: query);
      return response;
    } catch (e) {
      return Response(statusCode: 500, statusText: 'Error: $e');
    }
  }

  Future<Response> post({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _connect.post(url, body, headers: headers);
      return response;
    } catch (e) {
      return Response(statusCode: 500, statusText: 'Error: $e');
    }
  }

  Future<Response> put({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _connect.put(url, body, headers: headers);
      return response;
    } catch (e) {
      return Response(statusCode: 500, statusText: 'Error: $e');
    }
  }

  Future<Response> delete({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _connect.delete(url, headers: headers);
      return response;
    } catch (e) {
      return Response(statusCode: 500, statusText: 'Error: $e');
    }
  }
}
