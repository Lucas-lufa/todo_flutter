import 'package:ljf_todo/models/todo.dart';

abstract class IDataSource {
  Future<List<Todo>> browse();
  Future<bool> add(Todo model);
  Future<bool> delete(Todo model);
  Future<bool?> read(Todo id);
  Future<bool> edit(
    Todo model,
    String? name,
    String? description,
    bool? complete,
  );
}
