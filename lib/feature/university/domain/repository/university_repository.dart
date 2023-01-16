
import '../../data/model/university_models.dart';

abstract class UniversityRepository {
  Future<List<University>?> getListUniversity();
}
