import '../tables.dart';

class UserDao extends Dao<User> {
  UserDao(AppDatabase db) : super(db);

  @override
  Future deleteEntity(User entity) {
    return delete(users).delete(entity);
  }

  @override
  Future<List<User>> getAll() {
    return select(users).get();
  }

  @override
  Future insertEntity(User entity) {
    return into(users).insert(entity);
  }

  Future insertCompanion(UsersCompanion entity) {
    return into(users).insert(entity);
  }

  Future<int> deleteAll() {
    return delete(users).go();
  }

  @override
  Future updateEntity(User entity) {
    return update(users).replace(entity);
  }

}
