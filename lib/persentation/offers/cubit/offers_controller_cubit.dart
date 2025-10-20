import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_task/core/network/local/db_helper.dart';
import 'package:flutter_task/persentation/offers/model/brands_model.dart';
import 'package:flutter_task/persentation/offers/model/categories_model.dart';
import 'package:flutter_task/persentation/offers/model/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offers_controller_state.dart';
part 'offers_controller_cubit.freezed.dart';

class OffersControllerCubit extends Cubit<OffersControllerState> {
  final DBHelper dbHelper;
  OffersControllerCubit({required this.dbHelper})
    : super(OffersControllerState.initial()) {
    getCategories();
    getBrands();
    getProducts();
  }
  void selectCategory(int value) {
    emit(state.copyWith(selectedCategory: value));
    getProducts();
  }

  void selectBrnad(int value) => emit(state.copyWith(selectedBrand: value));

  Future<void> getCategories() async {
    emit(state.copyWith(categoryStatus: CategoryStatus.loading));
    await Future.delayed(Duration(seconds: 5), () async {
      await dbHelper
          .getAll("categories")
          .then(
            (value) => emit(
              state.copyWith(
                categoryStatus: CategoryStatus.loaded,
                categoriesList: value
                    .map((e) => CategoriesModel.fromJson(e))
                    .toList(),
              ),
            ),
          )
          .catchError(
            (error) => emit(
              state.copyWith(
                categoryStatus: CategoryStatus.error,
                errorcategoriesList: error.toString(),
              ),
            ),
          );
    });
  }

  Future<void> getBrands() async {
    emit(state.copyWith(brandStatus: BrandStatus.loading));
    await Future.delayed(Duration(seconds: 5), () async {
      await dbHelper
          .getAll("brands")
          .then(
            (value) => emit(
              state.copyWith(
                brandStatus: BrandStatus.loaded,
                brandsList: value.map((e) => BrandsModel.fromJson(e)).toList(),
              ),
            ),
          )
          .catchError(
            (error) => emit(
              state.copyWith(
                brandStatus: BrandStatus.error,
                errorbrandsList: error.toString(),
              ),
            ),
          );
    });
  }

  Future<void> getProducts() async {
    emit(state.copyWith(productStatus: ProductsStatus.loading));
    await Future.delayed(Duration(seconds: 5), () async {
      await dbHelper
          .getProductsWithOffers(state.selectedCategory)
          .then((value) {
            emit(
              state.copyWith(
                productStatus: ProductsStatus.loaded,
                productsList: value
                    .map((e) => ProductsModel.fromJson(e))
                    .toList(),
              ),
            );
          })
          .catchError((error) {
            log(error.toString());
            emit(
              state.copyWith(
                productStatus: ProductsStatus.error,
                errorbrandsList: error.toString(),
              ),
            );
          });
    });
  }
}
