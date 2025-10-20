part of 'offers_controller_cubit.dart';

@freezed
class OffersControllerState with _$OffersControllerState {
  const factory OffersControllerState({@Default(1) int selectedCategory,
  @Default(CategoryStatus.initial) CategoryStatus categoryStatus,
  @Default([]) List<CategoriesModel> categoriesList,
  @Default('') String errorcategoriesList,
  @Default(1) int selectedBrand,
  @Default(BrandStatus.initial) BrandStatus brandStatus,
  @Default([]) List<BrandsModel> brandsList,
  @Default('') String errorbrandsList,
 
  @Default(ProductsStatus.initial) ProductsStatus productStatus,
  @Default([]) List<ProductsModel> productsList,
  @Default('') String errorprodutsList,
  }) =_OffersControllerState;
  factory OffersControllerState.initial() => OffersControllerState();
}

// Enum for loading states
enum CategoryStatus { initial, loading,loaded,error}

enum BrandStatus { initial, loading,loaded,error}

enum ProductsStatus { initial, loading,loaded,error}
