import 'package:dio/dio.dart';
import 'package:practice_app/new/network/api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/university_models.dart';

class ApiRepository {
  final Dio _dio = Dio();

  Future<List<University>?> getListUniversity() async {
    try {
      _dio.interceptors.add(PrettyDioLogger());
      final client = ApiClient(_dio);
      return client.universityList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    return null;
  }
}

class NetworkError extends Error {}
