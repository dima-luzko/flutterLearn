
import 'package:dio/dio.dart';
import 'package:practice_app/university/api/api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'models/university_model.dart';

class ApiRepository {
   final Dio dio = Dio();

   Future<List<UniversityData>?> getListUniversity() async {
     try {
       dio.interceptors.add(PrettyDioLogger());
       final client = ApiClient(dio);
       return client.getUniversityList();
     } catch(error, stacktrace) {
       print("Exception occured: $error stackTrace: $stacktrace");
       //return University.withError("Data not found");
     }

   }
}

class NetworkError extends Error {}