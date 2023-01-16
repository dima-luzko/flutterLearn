import 'package:practice_app/data/model/university_models.dart';
import '../repository/university_repository.dart';

class GetUniversityList {
 final UniversityRepository _universityRepository;

  GetUniversityList(this._universityRepository);

  Future<List<University>?> getUniversityList() async {
    return _universityRepository.getListUniversity();
  }
}
