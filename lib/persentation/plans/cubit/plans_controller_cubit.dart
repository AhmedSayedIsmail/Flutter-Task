import 'package:bloc/bloc.dart';
import 'package:flutter_task/core/network/local/db_helper.dart';
import 'package:flutter_task/persentation/plans/model/packages_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plans_controller_state.dart';
part 'plans_controller_cubit.freezed.dart';

class PlansControllerCubit extends Cubit<PlansControllerState> {
  final DBHelper dbHelper;
  PlansControllerCubit({required this.dbHelper})
    : super(PlansControllerState.initial());
  Future<void> getPackages() async {
    emit(state.copyWith(packagesStatus: PackagesStatus.loading));
    await Future.delayed(Duration(seconds: 5), () async {
      await dbHelper
          .getAllPackages()
          .then(
            (value) => emit(
              state.copyWith(
                packagesStatus: PackagesStatus.loaded,
                packagesList: value
                    .map((e) => PackagesModel.fromJson(e))
                    .toList(),
              ),
            ),
          )
          .catchError(
            (error) => emit(
              state.copyWith(
                packagesStatus: PackagesStatus.error,
                errorpackagesList: error.toString(),
              ),
            ),
          );
    });
  }

  void selectPackage({required bool value, required int id}) {
    final updatedList = List<int>.from(state.packagesChecked);
    if (value) {
      if (!updatedList.contains(id)) {
        updatedList.add(id);
      }
    } else {
      updatedList.remove(id);
    }

    emit(state.copyWith(packagesChecked: updatedList));
  }
}
