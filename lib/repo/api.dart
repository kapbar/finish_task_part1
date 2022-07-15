import 'package:dio/dio.dart';

class Api {
  late final dio = Dio(options);

  final options = BaseOptions(
    baseUrl: 'https://fakestoreapi.com',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );
}