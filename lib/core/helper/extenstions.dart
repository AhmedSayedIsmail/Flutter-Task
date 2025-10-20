import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? argument}) {
    return Navigator.of(this).pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? argument}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> pushNamedAndRemoveUtil(
    String routeName, {
    Object? argument,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: argument);
  }

  void pop() => Navigator.of(this).pop();
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension MapExtension<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension Trans on BuildContext {
  String get exploreoffers => tr("ExploreOffers");
  String get all => tr("All");
  String get freeCharge => tr("FreeCharge");
  String get forEachOffer => tr("ForEachOffer");
  String get choosePackages => tr("ChoosePackages");
  String get choosePackagesSub => tr("ChoosePackagesSub");
  String get specialPackeges => tr("SpecialPackeges");
  String get conectUsForPackage => tr("ConectUsForPackage");
  String get salesTeam => tr("SalesTeam");
  String get next => tr("Next");
  String get filter => tr("Filter");
  String get backToDefault => tr("BackToDefault");
  String get category => tr("Category");
  String get location => tr("Location");
  String get monthlyInstallments => tr("MonthlyInstallments");
  String get type => tr("Type");
  String get numberofRooms => tr("NumberofRooms");
  String get price => tr("Price");
  String get paymentMethod => tr("PaymentMethod");
  String get propertyCondition => tr("PropertyCondition");
  String get change => tr("Change");
}


final Map<String, IconData> featureIcons = {
  "صلاحية الإعلان": Icons.access_time,
  "صالح لمدة": Icons.access_time,
  "رفع لأعلى القائمة": Icons.publish,
  "تثبيت في مقاول صحي": Icons.push_pin,
  "ظهور في كل محافظات مصر": Icons.public,
  "إعلان مميز": Icons.star,
  "ضعف عدد المشاهدات": Icons.visibility,
};
