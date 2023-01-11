
import 'package:freezed_annotation/freezed_annotation.dart';
import '../model/university_models.dart';

part 'university_state.freezed.dart';

@freezed
class UniversityState with _$UniversityState {

  const factory UniversityState.data(List<University> data) = Data;
  const factory UniversityState.loading() = Loading;
  const factory UniversityState.error([String? message]) = Error;
}