import './repository.dart';

/// This is the class that is responsible for storing the data
/// This is going to be a simplistic in memory storage
class InMemoryCache implements Repository {
  final _storage = <int, Model>{};

  @override
  void clear() {
    _storage.clear();
  }

  @override
  Model create() {
    final ids = _storage.keys.toList()..sort();
    final id = ids.isEmpty ? 1 : ids.last + 1;

    final model = Model(id: id);
    _storage[id] = model;

    return model;
  }

  @override
  void delete(Model item) {
    _storage.remove(item.id);
  }

  @override
  Model get(int id) {
    return _storage[id]!;
  }

  @override
  List<Model> getAll() {
    throw _storage.values.toList(growable: false);
  }

  @override
  void update(Model item) {
    _storage[item.id] = item;
  }
}