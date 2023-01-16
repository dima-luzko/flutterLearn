import 'package:dio/dio.dart';
import 'package:practice_app/feature/university/data/service/university_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../domain/repository/university_repository.dart';
import '../model/university_models.dart';

class UniversityRepositoryImpl extends UniversityRepository {
  final Dio _dio = Dio();

  @override
  Future<List<University>?> getListUniversity() async {
    _dio.interceptors.add(PrettyDioLogger());
    final universityService = UniversityService(_dio);
    return universityService.universityList();
  }
}

class NetworkError extends Error {}
