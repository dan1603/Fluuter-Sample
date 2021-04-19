import 'package:finance_flutter_app/db/tables.dart';

class WalletDao extends Dao<Wallet> {
  WalletDao(AppDatabase db): super(db);

  @override
  Future deleteEntity(Wallet entity) {
    return delete(wallets).delete(entity);
  }

  @override
  Future<List<Wallet>> getAll() {
    return select(wallets).get();
  }

  @override
  Future insertEntity(Wallet entity) {
    return into(wallets).insertOnConflictUpdate(entity);
  }

  @override
  Future updateEntity(Wallet entity) {
    return update(wallets).replace(entity);
  }

  Future insertCompanion(WalletsCompanion entity) {
    return into(wallets).insert(entity);
  }

}
