import 'package:bloc/bloc.dart';
import 'package:flutter_task/core/network/local/db_helper.dart';
import 'package:flutter_task/persentation/filtering/models/rooms_model.dart';
import 'package:flutter_task/persentation/filtering/models/types_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filtring_controller_state.dart';
part 'filtring_controller_cubit.freezed.dart';

class FiltringControllerCubit extends Cubit<FiltringControllerState> {
  final DBHelper dbHelper;

  FiltringControllerCubit(this.dbHelper)
    : super(FiltringControllerState.initial()) {
    getTypes();
    getRooms();
  }
  void selectPayment(int value) => emit(state.copyWith(selectedPayment: value));
  void selectType(int value) => emit(state.copyWith(selectedType: value));
  void selectRoom(int value) => emit(state.copyWith(selectedRoomsNo: value));
  Future<void> getTypes() async {
    emit(state.copyWith(typesStatus: TypesStatus.loading));
    await Future.delayed(Duration(seconds: 5), () async {
      await dbHelper
          .getAll("types")
          .then(
            (value) => emit(
              state.copyWith(
                typesStatus: TypesStatus.loaded,
                typesList: value.map((e) => TypesModel.fromJson(e)).toList(),
              ),
            ),
          )
          .catchError(
            (error) => emit(
              state.copyWith(
                typesStatus: TypesStatus.error,
                errorctypesList: error.toString(),
              ),
            ),
          );
    });
  }

  Future<void> getRooms() async {
    emit(state.copyWith(roomsStatus: RoomsStatus.loading));
    await Future.delayed(Duration(seconds: 5), () async {
      await dbHelper
          .getAll("rooms")
          .then(
            (value) => emit(
              state.copyWith(
                roomsStatus: RoomsStatus.loaded,
                roomsList: value.map((e) => RoomsModel.fromJson(e)).toList(),
              ),
            ),
          )
          .catchError(
            (error) => emit(
              state.copyWith(
                roomsStatus: RoomsStatus.error,
                errorcroomsList: error.toString(),
              ),
            ),
          );
    });
  }
}
