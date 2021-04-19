import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'tables.g.dart';

@DataClassName("User")
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text()();
}

@DataClassName("Wallet")
class Wallets extends Table {
  IntColumn get id => integer()();
  IntColumn get userId => integer()();
  IntColumn get currencyId => integer()();
  TextColumn get currencyCode => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get iban => text()();
}

@UseMoor(
  tables: [Users, Wallets], daos: [Dao]
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_createDatabase());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _createDatabase() {
  return LazyDatabase(() async {
    final dbLocation = await getApplicationDocumentsDirectory();
    final dbFile = File(path.join(dbLocation.path, 'db.sqlite'));
    return VmDatabase(dbFile);
  });
}

@UseDao(
    tables: [Users, Wallets]
)
abstract class Dao<T> extends DatabaseAccessor<AppDatabase> with _$DaoMixin {
  Dao(AppDatabase db) : super(db);

  setUser(User entry) => update(users).replace(entry);

  Future<List<T>> getAll();

  Future insertEntity(T entity);

  Future updateEntity(T entity);

  Future deleteEntity(T entity);
}
