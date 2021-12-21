// import 'package:flutter/foundation.dart';

/// The [Repository] class is not supposed to know anything about
/// fetching data. This is important, as we want to keep the separation of concerns
abstract class Repository {
  Model create();

  List<Model> getAll();

  Model get(int id);

  void update(Model item);

  void delete(Model item);

  void clear();
}

class Model {
  final int id;
  final Map data;

  const Model({required this.id, this.data = const {}});
}
