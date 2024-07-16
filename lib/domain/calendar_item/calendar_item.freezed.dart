// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarItem {
  String get value => throw _privateConstructorUsedError;
  bool get isTitle => throw _privateConstructorUsedError;
  bool get isSunday => throw _privateConstructorUsedError;
  bool get isToday => throw _privateConstructorUsedError;
  bool get isCurrentMonth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarItemCopyWith<CalendarItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarItemCopyWith<$Res> {
  factory $CalendarItemCopyWith(
          CalendarItem value, $Res Function(CalendarItem) then) =
      _$CalendarItemCopyWithImpl<$Res, CalendarItem>;
  @useResult
  $Res call(
      {String value,
      bool isTitle,
      bool isSunday,
      bool isToday,
      bool isCurrentMonth});
}

/// @nodoc
class _$CalendarItemCopyWithImpl<$Res, $Val extends CalendarItem>
    implements $CalendarItemCopyWith<$Res> {
  _$CalendarItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isTitle = null,
    Object? isSunday = null,
    Object? isToday = null,
    Object? isCurrentMonth = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isTitle: null == isTitle
          ? _value.isTitle
          : isTitle // ignore: cast_nullable_to_non_nullable
              as bool,
      isSunday: null == isSunday
          ? _value.isSunday
          : isSunday // ignore: cast_nullable_to_non_nullable
              as bool,
      isToday: null == isToday
          ? _value.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrentMonth: null == isCurrentMonth
          ? _value.isCurrentMonth
          : isCurrentMonth // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarItemImplCopyWith<$Res>
    implements $CalendarItemCopyWith<$Res> {
  factory _$$CalendarItemImplCopyWith(
          _$CalendarItemImpl value, $Res Function(_$CalendarItemImpl) then) =
      __$$CalendarItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String value,
      bool isTitle,
      bool isSunday,
      bool isToday,
      bool isCurrentMonth});
}

/// @nodoc
class __$$CalendarItemImplCopyWithImpl<$Res>
    extends _$CalendarItemCopyWithImpl<$Res, _$CalendarItemImpl>
    implements _$$CalendarItemImplCopyWith<$Res> {
  __$$CalendarItemImplCopyWithImpl(
      _$CalendarItemImpl _value, $Res Function(_$CalendarItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isTitle = null,
    Object? isSunday = null,
    Object? isToday = null,
    Object? isCurrentMonth = null,
  }) {
    return _then(_$CalendarItemImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isTitle: null == isTitle
          ? _value.isTitle
          : isTitle // ignore: cast_nullable_to_non_nullable
              as bool,
      isSunday: null == isSunday
          ? _value.isSunday
          : isSunday // ignore: cast_nullable_to_non_nullable
              as bool,
      isToday: null == isToday
          ? _value.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrentMonth: null == isCurrentMonth
          ? _value.isCurrentMonth
          : isCurrentMonth // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CalendarItemImpl implements _CalendarItem {
  const _$CalendarItemImpl(
      {required this.value,
      required this.isTitle,
      required this.isSunday,
      required this.isToday,
      required this.isCurrentMonth});

  @override
  final String value;
  @override
  final bool isTitle;
  @override
  final bool isSunday;
  @override
  final bool isToday;
  @override
  final bool isCurrentMonth;

  @override
  String toString() {
    return 'CalendarItem(value: $value, isTitle: $isTitle, isSunday: $isSunday, isToday: $isToday, isCurrentMonth: $isCurrentMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarItemImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isTitle, isTitle) || other.isTitle == isTitle) &&
            (identical(other.isSunday, isSunday) ||
                other.isSunday == isSunday) &&
            (identical(other.isToday, isToday) || other.isToday == isToday) &&
            (identical(other.isCurrentMonth, isCurrentMonth) ||
                other.isCurrentMonth == isCurrentMonth));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, value, isTitle, isSunday, isToday, isCurrentMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarItemImplCopyWith<_$CalendarItemImpl> get copyWith =>
      __$$CalendarItemImplCopyWithImpl<_$CalendarItemImpl>(this, _$identity);
}

abstract class _CalendarItem implements CalendarItem {
  const factory _CalendarItem(
      {required final String value,
      required final bool isTitle,
      required final bool isSunday,
      required final bool isToday,
      required final bool isCurrentMonth}) = _$CalendarItemImpl;

  @override
  String get value;
  @override
  bool get isTitle;
  @override
  bool get isSunday;
  @override
  bool get isToday;
  @override
  bool get isCurrentMonth;
  @override
  @JsonKey(ignore: true)
  _$$CalendarItemImplCopyWith<_$CalendarItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
