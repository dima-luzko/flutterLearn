import 'package:dio/dio.dart';
import 'package:practice_app/data/service/api_client.dart';
import 'package:practice_app/domain/repository/university_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/university_models.dart';

class UniversityRepositoryImpl extends UniversityRepository {
  final Dio _dio = Dio();

  @override
  Future<List<University>?> getListUniversity() async {
    _dio.interceptors.add(PrettyDioLogger());
    final client = ApiClient(_dio);
    return client.universityList();
  }
}

class NetworkError extends Error {}
