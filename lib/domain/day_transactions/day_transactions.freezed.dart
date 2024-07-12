// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_transactions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DayTransactions {
  DateTime get date => throw _privateConstructorUsedError;
  List<Transaction> get transactions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DayTransactionsCopyWith<DayTransactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayTransactionsCopyWith<$Res> {
  factory $DayTransactionsCopyWith(
          DayTransactions value, $Res Function(DayTransactions) then) =
      _$DayTransactionsCopyWithImpl<$Res, DayTransactions>;
  @useResult
  $Res call({DateTime date, List<Transaction> transactions});
}

/// @nodoc
class _$DayTransactionsCopyWithImpl<$Res, $Val extends DayTransactions>
    implements $DayTransactionsCopyWith<$Res> {
  _$DayTransactionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayTransactionsImplCopyWith<$Res>
    implements $DayTransactionsCopyWith<$Res> {
  factory _$$DayTransactionsImplCopyWith(_$DayTransactionsImpl value,
          $Res Function(_$DayTransactionsImpl) then) =
      __$$DayTransactionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, List<Transaction> transactions});
}

/// @nodoc
class __$$DayTransactionsImplCopyWithImpl<$Res>
    extends _$DayTransactionsCopyWithImpl<$Res, _$DayTransactionsImpl>
    implements _$$DayTransactionsImplCopyWith<$Res> {
  __$$DayTransactionsImplCopyWithImpl(
      _$DayTransactionsImpl _value, $Res Function(_$DayTransactionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? transactions = null,
  }) {
    return _then(_$DayTransactionsImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc

class _$DayTransactionsImpl extends _DayTransactions {
  const _$DayTransactionsImpl(
      {required this.date, required final List<Transaction> transactions})
      : _transactions = transactions,
        super._();

  @override
  final DateTime date;
  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'DayTransactions(date: $date, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayTransactionsImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayTransactionsImplCopyWith<_$DayTransactionsImpl> get copyWith =>
      __$$DayTransactionsImplCopyWithImpl<_$DayTransactionsImpl>(
          this, _$identity);
}

abstract class _DayTransactions extends DayTransactions {
  const factory _DayTransactions(
      {required final DateTime date,
      required final List<Transaction> transactions}) = _$DayTransactionsImpl;
  const _DayTransactions._() : super._();

  @override
  DateTime get date;
  @override
  List<Transaction> get transactions;
  @override
  @JsonKey(ignore: true)
  _$$DayTransactionsImplCopyWith<_$DayTransactionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
