import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/university/university_event.dart';
import 'package:practice_app/university/university_repository.dart';
import 'package:practice_app/university/university_state.dart';

// part 'university_event.dart';
// part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  UniversityBloc() : super(UniversityInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetUniversityList>((event, emit) async {
      try {
        emit(UniversityLoading());
        final mList = await apiRepository.getListUniversity();
        emit(UniversityLoaded(mList!));
        // if (mList.error != null) {
        //   emit(UniversityError(mList.error));
        // }
      } on NetworkError {
        emit(const UniversityError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
