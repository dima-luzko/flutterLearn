import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/feature/university/domain/use_case/university_use_case.dart';
import 'package:practice_app/feature/university/presentation/bloc/university_event.dart';
import 'package:practice_app/feature/university/presentation/bloc/university_state.dart';
import '../../data/model/university_models.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  final UniversityUseCase universityUseCase;
  var listUniversity = <University>[];

  UniversityBloc(this.universityUseCase) : super(const UniversityState.loading()) {
    on<LoadUniversities>((event, emit) async {
      emit(const UniversityState.loading());
      try {
        final universitiesList = await universityUseCase.getUniversityList();
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
