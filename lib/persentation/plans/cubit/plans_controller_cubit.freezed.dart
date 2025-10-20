// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plans_controller_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PlansControllerState {
  List<int> get packagesChecked => throw _privateConstructorUsedError;
  PackagesStatus get packagesStatus => throw _privateConstructorUsedError;
  List<PackagesModel> get packagesList => throw _privateConstructorUsedError;
  String get errorpackagesList => throw _privateConstructorUsedError;

  /// Create a copy of PlansControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlansControllerStateCopyWith<PlansControllerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlansControllerStateCopyWith<$Res> {
  factory $PlansControllerStateCopyWith(
    PlansControllerState value,
    $Res Function(PlansControllerState) then,
  ) = _$PlansControllerStateCopyWithImpl<$Res, PlansControllerState>;
  @useResult
  $Res call({
    List<int> packagesChecked,
    PackagesStatus packagesStatus,
    List<PackagesModel> packagesList,
    String errorpackagesList,
  });
}

/// @nodoc
class _$PlansControllerStateCopyWithImpl<
  $Res,
  $Val extends PlansControllerState
>
    implements $PlansControllerStateCopyWith<$Res> {
  _$PlansControllerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlansControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packagesChecked = null,
    Object? packagesStatus = null,
    Object? packagesList = null,
    Object? errorpackagesList = null,
  }) {
    return _then(
      _value.copyWith(
            packagesChecked: null == packagesChecked
                ? _value.packagesChecked
                : packagesChecked // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            packagesStatus: null == packagesStatus
                ? _value.packagesStatus
                : packagesStatus // ignore: cast_nullable_to_non_nullable
                      as PackagesStatus,
            packagesList: null == packagesList
                ? _value.packagesList
                : packagesList // ignore: cast_nullable_to_non_nullable
                      as List<PackagesModel>,
            errorpackagesList: null == errorpackagesList
                ? _value.errorpackagesList
                : errorpackagesList // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlansControllerStateImplCopyWith<$Res>
    implements $PlansControllerStateCopyWith<$Res> {
  factory _$$PlansControllerStateImplCopyWith(
    _$PlansControllerStateImpl value,
    $Res Function(_$PlansControllerStateImpl) then,
  ) = __$$PlansControllerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<int> packagesChecked,
    PackagesStatus packagesStatus,
    List<PackagesModel> packagesList,
    String errorpackagesList,
  });
}

/// @nodoc
class __$$PlansControllerStateImplCopyWithImpl<$Res>
    extends _$PlansControllerStateCopyWithImpl<$Res, _$PlansControllerStateImpl>
    implements _$$PlansControllerStateImplCopyWith<$Res> {
  __$$PlansControllerStateImplCopyWithImpl(
    _$PlansControllerStateImpl _value,
    $Res Function(_$PlansControllerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlansControllerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packagesChecked = null,
    Object? packagesStatus = null,
    Object? packagesList = null,
    Object? errorpackagesList = null,
  }) {
    return _then(
      _$PlansControllerStateImpl(
        packagesChecked: null == packagesChecked
            ? _value._packagesChecked
            : packagesChecked // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        packagesStatus: null == packagesStatus
            ? _value.packagesStatus
            : packagesStatus // ignore: cast_nullable_to_non_nullable
                  as PackagesStatus,
        packagesList: null == packagesList
            ? _value._packagesList
            : packagesList // ignore: cast_nullable_to_non_nullable
                  as List<PackagesModel>,
        errorpackagesList: null == errorpackagesList
            ? _value.errorpackagesList
            : errorpackagesList // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$PlansControllerStateImpl implements _PlansControllerState {
  const _$PlansControllerStateImpl({
    final List<int> packagesChecked = const [],
    this.packagesStatus = PackagesStatus.initial,
    final List<PackagesModel> packagesList = const [],
    this.errorpackagesList = '',
  }) : _packagesChecked = packagesChecked,
       _packagesList = packagesList;

  final List<int> _packagesChecked;
  @override
  @JsonKey()
  List<int> get packagesChecked {
    if (_packagesChecked is EqualUnmodifiableListView) return _packagesChecked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packagesChecked);
  }

  @override
  @JsonKey()
  final PackagesStatus packagesStatus;
  final List<PackagesModel> _packagesList;
  @override
  @JsonKey()
  List<PackagesModel> get packagesList {
    if (_packagesList is EqualUnmodifiableListView) return _packagesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packagesList);
  }

  @override
  @JsonKey()
  final String errorpackagesList;

  @override
  String toString() {
    return 'PlansControllerState(packagesChecked: $packagesChecked, packagesStatus: $packagesStatus, packagesList: $packagesList, errorpackagesList: $errorpackagesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlansControllerStateImpl &&
            const DeepCollectionEquality().equals(
              other._packagesChecked,
              _packagesChecked,
            ) &&
            (identical(other.packagesStatus, packagesStatus) ||
                other.packagesStatus == packagesStatus) &&
            const DeepCollectionEquality().equals(
              other._packagesList,
              _packagesList,
            ) &&
            (identical(other.errorpackagesList, errorpackagesList) ||
                other.errorpackagesList == errorpackagesList));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_packagesChecked),
    packagesStatus,
    const DeepCollectionEquality().hash(_packagesList),
    errorpackagesList,
  );

  /// Create a copy of PlansControllerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlansControllerStateImplCopyWith<_$PlansControllerStateImpl>
  get copyWith =>
      __$$PlansControllerStateImplCopyWithImpl<_$PlansControllerStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PlansControllerState implements PlansControllerState {
  const factory _PlansControllerState({
    final List<int> packagesChecked,
    final PackagesStatus packagesStatus,
    final List<PackagesModel> packagesList,
    final String errorpackagesList,
  }) = _$PlansControllerStateImpl;

  @override
  List<int> get packagesChecked;
  @override
  PackagesStatus get packagesStatus;
  @override
  List<PackagesModel> get packagesList;
  @override
  String get errorpackagesList;

  /// Create a copy of PlansControllerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlansControllerStateImplCopyWith<_$PlansControllerStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
