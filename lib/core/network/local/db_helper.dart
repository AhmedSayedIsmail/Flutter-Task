import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'shop_app.db');

    // await deleteDatabase(path);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    //  إنشاء الجداول
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE brands (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        image TEXT,
        category_id INTEGER,
        FOREIGN KEY (category_id) REFERENCES categories(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE packages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        price REAL NOT NULL,
        duration TEXT,
        features TEXT -- JSON string
      )
    ''');

    await db.execute('''
      CREATE TABLE offers (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT,
        discount_percent REAL,
        start_date TEXT,
        end_date TEXT,
        package_id INTEGER,
        product_id INTEGER,
        FOREIGN KEY (package_id) REFERENCES packages(id),
        FOREIGN KEY (product_id) REFERENCES products(id)
      )
    ''');
    await db.execute('''
      CREATE TABLE types (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE rooms (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    //Seeder
    await _seedData(db);
  }

  //Seeder Function
  Future<void> _seedData(Database db) async {
    // الفئات
    final categories = [
      'كل العروض',
      'ملابس',
      'الاكسسوارات',
      'الكترونيات',
      'الأحذية',
    ];

    for (var name in categories) {
      await db.insert('categories', {'name': name});
    }

    //البرندات
    final brands = [
      {'name': 'موضه رجالي', 'image': 'assets/images/ModaM.png'},
      {'name': 'ساعات', 'image': 'assets/images/watch.png'},
      {'name': 'موبايلات', 'image': 'assets/images/phone.png'},
      {'name': 'منتجات تجميل', 'image': 'assets/images/makeup.png'},
    ];

    for (var brand in brands) {
      await db.insert('brands', brand);
    }

    // المنتجات
    final products = [
      {
        'name': 'قميص رجالي كاجوال',
        'price': 150,
        'image': 'assets/images/shirt.png',
        'category_id': 1,
      },
      {
        'name': 'حذاء رياضي أسود',
        'price': 250,
        'image': 'assets/images/shose.png',
        'category_id': 5,
      },
      {
        'name': 'جاكيت من الصوف مناسب',
        'price': 200.0,
        'image': 'assets/images/jacketB.png',
        'category_id': 1,
      },
    ];

    for (var product in products) {
      await db.insert('products', product);
    }

    //  الباقات (مع features بصيغة JSON)
    final packages = [
      {
        'name': 'أساسية',
        'description': '2 جيجا لمدة 30 يوم',
        'price': 60,
        'duration': '30 يوم',
        'features': jsonEncode(['صالح لمدة 30 يوم']),
      },
      {
        'name': 'أكسترا',
        'price': 3000,
        'duration': '30 يوم',
        'features': jsonEncode([
          'صلاحية الإعلان 30 يوم',
          'رفع لأعلى القائمة كل 3 أيام',
          'تثبيت في مقاول صحي (خلال الـ48 ساعة القادمة)',
          'ضعف عدد المشاهدات (7)',
        ]),
      },
      {
        'name': 'بلس',
        'price': 5000.0,
        'duration': '30 يوم',
        'features': jsonEncode([
          'صلاحية الإعلان 30 يوم',
          'رفع لأعلى القائمة كل يومين',
          'تثبيت في مقاول صحي (خلال الـ48 ساعة القادمة)',
          'ظهور في كل محافظات مصر',
          'إعلان مميز',
          'تثبيت في مقاول صحي بالجمعة (خلال الـ48 ساعة القادمة)',
          'ضعف عدد المشاهدات (18)',
        ]),
      },
    ];

    for (var pkg in packages) {
      await db.insert('packages', pkg);
    }

    //  العروض
    await db.insert('offers', {
      'title': 'خصم 20% على القمصان',
      'description': 'احصل على خصم 20% على جميع القمصان الكاجوال',
      'discount_percent': 20.0,
      'start_date': '2025-10-01',
      'end_date': '2025-10-31',
      'product_id': 1,
    });

    final types = [
      'شقة',
      'فيلا',
      'دوبلكس',
      'بنتهاوس',
      'استوديو',
      'تاون هاوس',
      'توين هاوس',
    ];
    for (var name in types) {
      await db.insert('types', {'name': name});
    }

    final rooms = [
      'استوديو',
      'غرفة واحدة',
      'غرفتين',
      '3 غرف',
      '4 غرف',
      '5 غرف+',
    ];
    for (var name in rooms) {
      await db.insert('rooms', {'name': name});
    }
  }

  // دوال CRUD عامة
  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAll(String table) async {
    final db = await database;
    return await db.query(table);
  }

  Future<int> update(String table, Map<String, dynamic> data, int id) async {
    final db = await database;
    return await db.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(String table, int id) async {
    final db = await database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getProductsByCategory(
    int categoryId,
  ) async {
    final db = await database;
    if (categoryId == 1) {
      return await db.query('products');
    }
    return await db.query(
      'products',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );
  }

  Future<List<Map<String, dynamic>>> getActiveOffers() async {
    final db = await database;
    final now = DateTime.now().toIso8601String();
    return await db.query(
      'offers',
      where: 'start_date <= ? AND end_date >= ?',
      whereArgs: [now, now],
    );
  }

  //  المنتجات + العروض (لو موجودة)
  Future<List<Map<String, dynamic>>> getProductsWithOffers([
    int? categoryId,
  ]) async {
    final db = await database;
    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (categoryId != null && categoryId != 1) {
      whereClause = 'WHERE p.category_id = ?';
      whereArgs = [categoryId];
    }

    final result = await db.rawQuery('''
      SELECT 
        p.id AS product_id,
        p.name AS product_name,
        p.price AS original_price,
        p.image,
        p.category_id,
        o.id AS offer_id,
        o.title AS offer_title,
        o.description AS offer_description,
        o.discount_percent,
        o.start_date,
        o.end_date
      FROM products p
      LEFT JOIN offers o ON p.id = o.product_id
      $whereClause
    ''', whereArgs);

    return result;
  }

  //  دالة تجيب كل الباقات مع فكّ الـ features من JSON
  Future<List<Map<String, dynamic>>> getAllPackages() async {
    final db = await database;
    final result = await db.query('packages');

    return result.map((pkg) {
      final featuresJson = pkg['features'] as String?;
      List<String> featuresList = [];

      if (featuresJson != null && featuresJson.isNotEmpty) {
        try {
          final List<dynamic> decoded = jsonDecode(featuresJson);
          featuresList = decoded.map((f) => f.toString()).toList();
        } catch (e) {
          // لو حصل خطأ في فك JSON (لأي سبب)
          featuresList = [];
        }
      }

      return {
        'id': pkg['id'],
        'name': pkg['name'],
        'description': pkg['description'],
        'price': pkg['price'],
        'duration': pkg['duration'],
        'features': featuresList,
      };
    }).toList();
  }
}
