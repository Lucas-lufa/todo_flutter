import 'package:ljf_todo/models/todo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'i_data_source.dart';

class SqlDatasource implements IDataSource {
  late Database _database;

  static Future<IDataSource>createAsync() async {
    SqlDatasource datasource = SqlDatasource();
    await datasource.initalise();
    return datasource;
  }

  Future initalise() async {
    _database =
        await openDatabase(join(await getDatabasesPath(), 'todos_data.db'),
        version: 1,
        onCreate: (db, version) => {
          db.execute(
            'CREATE TABLE IF NOT EXISTS todos (id INTEGER PRIMARY KEY, name TEXT, description TEXT, complete INTEGER)')
        },
        );
  }

  @override
  Future<bool> add(Todo model) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> browse() async {
    List<Map<String, dynamic>> results = await _database.query('todos');
    return List.generate(results.length, (index) {
      return Todo.fromMap(results[index]);
    });
  }
    
  }

  @override
  Future<bool> delete(Todo model) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> edit(Todo model) {
    // TODO: implement edit
    throw UnimplementedError();
  }

  @override
  Future<bool?> read(Todo id) {
    // TODO: implement read
    throw UnimplementedError();
  }
}
