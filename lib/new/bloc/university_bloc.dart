import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/new/bloc/university_event.dart';
import 'package:practice_app/new/bloc/university_state.dart';
import '../model/university_models.dart';
import '../network/university_repository.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  final ApiRepository _apiRepository = ApiRepository();

  var listUniversity = <University>[];

  UniversityBloc() : super(const UniversityState.loading()) {
    on<LoadUniversities>((event, emit) async {
      emit(const UniversityState.loading());
      try {
        final universitiesList = await _apiRepository.getListUniversity();
        if (universitiesList!.isNotEmpty) {
          listUniversity = universitiesList;
          emit(UniversityState.data(universitiesList));
        } else {
          emit(const UniversityState.error("Data isEmpty!"));
        }
      } catch (error) {
        emit(const UniversityState.error(
            "Failed to fetch data. is your device online?"));
      }
    });
    on<LoadFilterUniversities>((event, emit) {
      var results = listUniversity
          .where((element) => element.country
              .toLowerCase()
              .contains(event.country.toLowerCase()))
          .toList();
      emit(UniversityState.data(results));
    });
  }
}
