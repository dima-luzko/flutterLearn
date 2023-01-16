import '../../data/model/university_models.dart';
import '../repository/university_repository.dart';

class UniversityUseCase {
 final UniversityRepository _universityRepository;

  UniversityUseCase(this._universityRepository);

  Future<List<University>?> getUniversityList() async {
    return _universityRepository.getListUniversity();
  }
}
