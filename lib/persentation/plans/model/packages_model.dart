import 'dart:convert';

class PackagesModel {
  final int id;
  final String name;
  final double price;
  final String? duration;
  final List<String> features;

  PackagesModel({
    required this.id,
    required this.name,
    required this.price,
    this.duration,
    required this.features,
  });

  /// ✅ Factory: يحول JSON أو Map إلى Model
  factory PackagesModel.fromJson(Map<String, dynamic> json) {
    // لو features جايه كنص JSON (من SQLite مثلًا)، نفكها
    final featuresData = json['features'];
    List<String> parsedFeatures = [];

    if (featuresData is String) {
      try {
        final decoded = jsonDecode(featuresData);
        parsedFeatures =
            (decoded as List).map((f) => f.toString()).toList();
      } catch (_) {
        parsedFeatures = [];
      }
    } else if (featuresData is List) {
      parsedFeatures = featuresData.map((f) => f.toString()).toList();
    }

    return PackagesModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      price: json['price'] is double
          ? json['price']
          : double.tryParse(json['price'].toString()) ?? 0.0,
      duration: json['duration']?.toString(),
      features: parsedFeatures,
    );
  }

  /// ✅ تحويل الموديل إلى JSON (لتخزينه في SQLite أو API)
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'duration': duration,
        'features': jsonEncode(features), // نحول الليست إلى نص JSON
      };
}
