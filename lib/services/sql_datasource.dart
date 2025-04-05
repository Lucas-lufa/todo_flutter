import 'package:ljf_todo/models/todo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'i_data_source.dart';

class SqlDatasource implements IDataSource {
  late Database _database;

  static Future<IDataSource> createAsync() async {
    SqlDatasource datasource = SqlDatasource();
    await datasource.initalise();
    return datasource;
  }

  Future initalise() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'todos_data.db'),
      version: 1,
      onCreate:
          (db, version) => {
            db.execute(
              'CREATE TABLE IF NOT EXISTS todos (id INTEGER PRIMARY KEY, name TEXT, description TEXT, complete INTEGER)',
            ),
          },
    );
  }

  @override
  Future<bool> add(Todo todo) async {
    Map<String, dynamic> toInsert = todo.toMap();
    toInsert.remove('id');
    int result = await _database.insert('todos', toInsert);
    return result != 0;
  }

  @override
  Future<List<Todo>> browse() async {
    List<Map<String, dynamic>> results = await _database.query('todos');
    return List.generate(results.length, (index) {
      return Todo.fromMap(results[index]);
    });
  }

  @override
  Future<bool> delete(Todo todo) async {
    int result = await _database.delete('todos', where: '?', whereArgs: ['id']);
    return result == 1;
  }

  @override
  Future<bool> edit(
    Todo todo,
    String? name,
    String? description,
    bool? complete,
  ) async {
    Map<String, dynamic> vales = {};
    if (name != null) {
      vales['name'] = name;
    }
    if (description != null) {
      vales['description'] = description;
    }
    if (complete != null) {
      vales['complete'] = complete;
    }
    int result = await _database.update(
      'todos',
      vales,
      where: 'id = ?',
      whereArgs: [todo.id],
    );
    return result > 0;
  }

  @override
  Future<bool?> read(Todo id) async {
    List<Map<String, dynamic>> result = await _database.query(
      'todos',
      whereArgs: [id],
    );
    return result.length == 1;
  }
}
