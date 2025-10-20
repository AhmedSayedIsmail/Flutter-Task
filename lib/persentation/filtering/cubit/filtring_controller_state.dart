part of 'filtring_controller_cubit.dart';

@freezed
class FiltringControllerState with _$FiltringControllerState {
  const factory FiltringControllerState({
    @Default(1) int selectedPayment,
    @Default(1) int selectedType,
    @Default(1) int selectedRoomsNo,
    @Default(TypesStatus.initial) TypesStatus typesStatus,
    @Default([]) List<TypesModel> typesList,
    @Default('') String errorctypesList,
    
    @Default(RoomsStatus.initial) RoomsStatus roomsStatus,
    @Default([]) List<RoomsModel> roomsList,
    @Default('') String errorcroomsList,
  }) = _FiltringControllerState;
  factory FiltringControllerState.initial() => FiltringControllerState();
}

// Enum for loading states
enum TypesStatus { initial, loading, loaded, error }

enum RoomsStatus { initial, loading, loaded, error }
