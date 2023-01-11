import 'package:equatable/equatable.dart';

abstract class UniversityEvent extends Equatable {

  const UniversityEvent();

  @override
  List<Object?> get props => [];
}

class GetUniversityList extends UniversityEvent {}