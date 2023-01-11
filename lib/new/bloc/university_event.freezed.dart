// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'university_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UniversityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUniversities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUniversities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUniversities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUniversities value) loadUniversities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUniversities value)? loadUniversities,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUniversities value)? loadUniversities,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UniversityEventCopyWith<$Res> {
  factory $UniversityEventCopyWith(
          UniversityEvent value, $Res Function(UniversityEvent) then) =
      _$UniversityEventCopyWithImpl<$Res, UniversityEvent>;
}

/// @nodoc
class _$UniversityEventCopyWithImpl<$Res, $Val extends UniversityEvent>
    implements $UniversityEventCopyWith<$Res> {
  _$UniversityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadUniversitiesCopyWith<$Res> {
  factory _$$LoadUniversitiesCopyWith(
          _$LoadUniversities value, $Res Function(_$LoadUniversities) then) =
      __$$LoadUniversitiesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadUniversitiesCopyWithImpl<$Res>
    extends _$UniversityEventCopyWithImpl<$Res, _$LoadUniversities>
    implements _$$LoadUniversitiesCopyWith<$Res> {
  __$$LoadUniversitiesCopyWithImpl(
      _$LoadUniversities _value, $Res Function(_$LoadUniversities) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadUniversities implements LoadUniversities {
  const _$LoadUniversities();

  @override
  String toString() {
    return 'UniversityEvent.loadUniversities()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadUniversities);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadUniversities,
  }) {
    return loadUniversities();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadUniversities,
  }) {
    return loadUniversities?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadUniversities,
    required TResult orElse(),
  }) {
    if (loadUniversities != null) {
      return loadUniversities();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadUniversities value) loadUniversities,
  }) {
    return loadUniversities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadUniversities value)? loadUniversities,
  }) {
    return loadUniversities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadUniversities value)? loadUniversities,
    required TResult orElse(),
  }) {
    if (loadUniversities != null) {
      return loadUniversities(this);
    }
    return orElse();
  }
}

abstract class LoadUniversities implements UniversityEvent {
  const factory LoadUniversities() = _$LoadUniversities;
}
