part of 'plans_controller_cubit.dart';

@freezed
class PlansControllerState with _$PlansControllerState {
  const factory PlansControllerState({
    @Default([])List<int> packagesChecked,
    @Default(PackagesStatus.initial) PackagesStatus packagesStatus,
    @Default([]) List<PackagesModel> packagesList,
    @Default('') String errorpackagesList,
  }) = _PlansControllerState;
  factory PlansControllerState.initial() => PlansControllerState();
}

enum PackagesStatus { initial, loading, loaded, error }
