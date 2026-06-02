import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/profile_model.dart';

class SQLiteHelper {
  static final SQLiteHelper instance = SQLiteHelper._init();
  static Database? _database;

  SQLiteHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('jobspot_profile_v2.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE profiles (
  id $idType,
  name $textType,
  email $textType,
  phone $textType,
  aboutMe $textType,
  workExperience $textType,
  education $textType,
  skill $textType,
  language $textType
)
''');
  }

  Future<int> insertProfile(Profile profile) async {
    final db = await instance.database;
    return await db.insert('profiles', profile.toMap());
  }

  Future<int> createProfile(Profile profile) async {
    return await insertProfile(profile);
  }

  Future<Profile?> getProfile() async {
    final db = await instance.database;
    final result = await db.query('profiles', limit: 1);
    if (result.isNotEmpty) {
      return Profile.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<List<Profile>> readAllProfiles() async {
    final db = await instance.database;
    final result = await db.query('profiles');
    return result.map((json) => Profile.fromMap(json)).toList();
  }

  Future<int> updateProfile(Profile profile) async {
    final db = await instance.database;
    return db.update(
      'profiles',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  Future<int> deleteProfile(int id) async {
    final db = await instance.database;
    return await db.delete('profiles', where: 'id = ?', whereArgs: [id]);
  }
}
