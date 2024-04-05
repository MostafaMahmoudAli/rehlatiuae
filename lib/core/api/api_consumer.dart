import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
    bool isForm = false,
  });

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    bool isForm = false,
  });

  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool isForm = false,
  });
}
