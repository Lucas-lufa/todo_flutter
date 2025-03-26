import 'package:ljf_todo/models/todo.dart';
import 'package:ljf_todo/services/i_data_source.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ljf_todo/firebase_options.dart';

class ApiDatasource implements IDataSource {
  late final FirebaseDatabase _database;

  Future initalise() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _database = FirebaseDatabase.instance;
  }

  static Future<ApiDatasource> createAsync() async {
    ApiDatasource dataSource = ApiDatasource();
    await dataSource.initalise();
    return dataSource;
  }

  @override
  Future<bool> add(Todo todo) async {
    DatabaseReference refTodo = _database.ref().child('todos').push();

    final key = refTodo.key;
    todo = todo.copyWith(newId: key);

    await refTodo.set(todo);
    return true;
  }

  @override
  Future<List<Todo>> browse() async {
    List<Todo> results = [];
    DatabaseReference ref = _database.ref();
    DataSnapshot snapshot = await ref.child('todos').get();

    if (!snapshot.exists) {
      throw Exception(
        'Invalid request ${snapshot.ref}',
      );
    }

    (snapshot.value as Map)
        .values
        .map((e) => Map<String, dynamic>.from(e))
        .forEach((item) => results.add(Todo.fromMap(item)));

    return results;
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
