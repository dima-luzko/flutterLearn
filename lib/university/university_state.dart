import 'package:equatable/equatable.dart';
import 'models/university_model.dart';

abstract class UniversityState extends Equatable {
  const UniversityState();

  @override
  List<Object> get props => [];
}

class UniversityInitial extends UniversityState {}

class UniversityLoading extends UniversityState {}

class UniversityLoaded extends UniversityState {
  final List<UniversityData>? universityModel;
  const UniversityLoaded(this.universityModel);
}

class UniversityError extends UniversityState {
  final String? message;
  const UniversityError(this.message);
}