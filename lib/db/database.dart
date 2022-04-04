import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:xpresshealthdev/model/visa_type_list.dart';

import '../model/country_list.dart';
import '../model/gender_list.dart';
import '../model/loctions_list.dart';
import '../model/user_type_list.dart';

class Db {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join('xpress_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      db.execute(
        'CREATE TABLE gender(row_id INTEGER , gender TEXT)',
      );

      db.execute(
        'CREATE TABLE locations(row_id INTEGER , location TEXT)',
      );

      db.execute(
        'CREATE TABLE usertype(row_id INTEGER , type TEXT)',
      );

      db.execute(
        'CREATE TABLE visatype(row_id INTEGER , type TEXT)',
      );

      return db.execute(
        'CREATE TABLE country(row_id INTEGER , country_name TEXT)',
      );
    },

    version: 1,
  );

  // Define a function that inserts dogs into the database
  Future<void> insertCountryList(CountryList dog) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflict algorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'country',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Define a function that inserts dogs into the database
  Future<void> insertGenderList(GenderList dog) async {
    // Get a reference to the database.
    final db = await database;
    // Insert the Dog into the correct table. You might also specify the
    // `conflict algorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'gender',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<GenderList>> getGenderList() async {
    final db = await database;
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('gender');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return GenderList(rowId: maps[i]['row_id'], gender: maps[i]['gender']);
    });
  }

  // Define a function that inserts dogs into the database
  Future<void> insertLoctionsList(LoctionsList dog) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflict algorithm` to use in case the same dog is inserted twice.
    // In this case, replace any previous data.
    await db.insert(
      'locations',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Define a function that inserts dogs into the database
  Future<void> insertVisaTypeList(VisaTypeList dog) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflict algorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'visatype',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Define a function that inserts dogs into the database
  Future<void> insertUserTypeList(UserTypeList dog) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflict algorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'usertype',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Define a function that inserts dogs into the database
  Future<void> clearDb() async {
    // Get a reference to the database.
    final db = await database;
    db.delete("country");
    db.delete("gender");
    db.delete("locations");
    db.delete("visatype");
    db.delete("usertype");
  }
}
