// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarState {
  List<CalendarItem> get calenderItems => throw _privateConstructorUsedError;
  String get currentMonth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
  @useResult
  $Res call({List<CalendarItem> calenderItems, String currentMonth});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calenderItems = null,
    Object? currentMonth = null,
  }) {
    return _then(_value.copyWith(
      calenderItems: null == calenderItems
          ? _value.calenderItems
          : calenderItems // ignore: cast_nullable_to_non_nullable
              as List<CalendarItem>,
      currentMonth: null == currentMonth
          ? _value.currentMonth
          : currentMonth // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarDataImplCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$$CalendarDataImplCopyWith(
          _$CalendarDataImpl value, $Res Function(_$CalendarDataImpl) then) =
      __$$CalendarDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CalendarItem> calenderItems, String currentMonth});
}

/// @nodoc
class __$$CalendarDataImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$CalendarDataImpl>
    implements _$$CalendarDataImplCopyWith<$Res> {
  __$$CalendarDataImplCopyWithImpl(
      _$CalendarDataImpl _value, $Res Function(_$CalendarDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calenderItems = null,
    Object? currentMonth = null,
  }) {
    return _then(_$CalendarDataImpl(
      calenderItems: null == calenderItems
          ? _value._calenderItems
          : calenderItems // ignore: cast_nullable_to_non_nullable
              as List<CalendarItem>,
      currentMonth: null == currentMonth
          ? _value.currentMonth
          : currentMonth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CalendarDataImpl implements _CalendarData {
  const _$CalendarDataImpl(
      {required final List<CalendarItem> calenderItems,
      required this.currentMonth})
      : _calenderItems = calenderItems;

  final List<CalendarItem> _calenderItems;
  @override
  List<CalendarItem> get calenderItems {
    if (_calenderItems is EqualUnmodifiableListView) return _calenderItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calenderItems);
  }

  @override
  final String currentMonth;

  @override
  String toString() {
    return 'CalendarState(calenderItems: $calenderItems, currentMonth: $currentMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarDataImpl &&
            const DeepCollectionEquality()
                .equals(other._calenderItems, _calenderItems) &&
            (identical(other.currentMonth, currentMonth) ||
                other.currentMonth == currentMonth));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_calenderItems), currentMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarDataImplCopyWith<_$CalendarDataImpl> get copyWith =>
      __$$CalendarDataImplCopyWithImpl<_$CalendarDataImpl>(this, _$identity);
}

abstract class _CalendarData implements CalendarState {
  const factory _CalendarData(
      {required final List<CalendarItem> calenderItems,
      required final String currentMonth}) = _$CalendarDataImpl;

  @override
  List<CalendarItem> get calenderItems;
  @override
  String get currentMonth;
  @override
  @JsonKey(ignore: true)
  _$$CalendarDataImplCopyWith<_$CalendarDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
