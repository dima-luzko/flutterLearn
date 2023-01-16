
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/university_models.dart';


part 'university_service.g.dart';

@RestApi(baseUrl: "http://universities.hipolabs.com")
abstract class UniversityService {
  factory UniversityService(Dio dio, {String baseUrl}) = _UniversityService;

  @GET('/search')
  Future<List<University>?> universityList();
}



