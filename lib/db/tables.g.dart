// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  User({@required this.id, @required this.username});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
    };
  }

  User copyWith({int id, String username}) => User(
        id: id ?? this.id,
        username: username ?? this.username,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, username.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User && other.id == this.id && other.username == this.username);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    @required String username,
  }) : username = Value(username);
  static Insertable<User> custom({
    Expression<int> id,
    Expression<String> username,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
    });
  }

  UsersCompanion copyWith({Value<int> id, Value<String> username}) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedTextColumn _username;
  @override
  GeneratedTextColumn get username => _username ??= _constructUsername();
  GeneratedTextColumn _constructUsername() {
    return GeneratedTextColumn(
      'username',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, username];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username'], _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Wallet extends DataClass implements Insertable<Wallet> {
  final int id;
  final int userId;
  final int currencyId;
  final String currencyCode;
  final String name;
  final String description;
  final String iban;
  Wallet(
      {@required this.id,
      @required this.userId,
      @required this.currencyId,
      @required this.currencyCode,
      @required this.name,
      @required this.description,
      @required this.iban});
  factory Wallet.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Wallet(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      userId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      currencyId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}currency_id']),
      currencyCode: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}currency_code']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      iban: stringType.mapFromDatabaseResponse(data['${effectivePrefix}iban']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || currencyId != null) {
      map['currency_id'] = Variable<int>(currencyId);
    }
    if (!nullToAbsent || currencyCode != null) {
      map['currency_code'] = Variable<String>(currencyCode);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || iban != null) {
      map['iban'] = Variable<String>(iban);
    }
    return map;
  }

  WalletsCompanion toCompanion(bool nullToAbsent) {
    return WalletsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      currencyId: currencyId == null && nullToAbsent
          ? const Value.absent()
          : Value(currencyId),
      currencyCode: currencyCode == null && nullToAbsent
          ? const Value.absent()
          : Value(currencyCode),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      iban: iban == null && nullToAbsent ? const Value.absent() : Value(iban),
    );
  }

  factory Wallet.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Wallet(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      currencyId: serializer.fromJson<int>(json['currencyId']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      iban: serializer.fromJson<String>(json['iban']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'currencyId': serializer.toJson<int>(currencyId),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'iban': serializer.toJson<String>(iban),
    };
  }

  Wallet copyWith(
          {int id,
          int userId,
          int currencyId,
          String currencyCode,
          String name,
          String description,
          String iban}) =>
      Wallet(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        currencyId: currencyId ?? this.currencyId,
        currencyCode: currencyCode ?? this.currencyCode,
        name: name ?? this.name,
        description: description ?? this.description,
        iban: iban ?? this.iban,
      );
  @override
  String toString() {
    return (StringBuffer('Wallet(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('currencyId: $currencyId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iban: $iban')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          userId.hashCode,
          $mrjc(
              currencyId.hashCode,
              $mrjc(
                  currencyCode.hashCode,
                  $mrjc(name.hashCode,
                      $mrjc(description.hashCode, iban.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Wallet &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.currencyId == this.currencyId &&
          other.currencyCode == this.currencyCode &&
          other.name == this.name &&
          other.description == this.description &&
          other.iban == this.iban);
}

class WalletsCompanion extends UpdateCompanion<Wallet> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> currencyId;
  final Value<String> currencyCode;
  final Value<String> name;
  final Value<String> description;
  final Value<String> iban;
  const WalletsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.iban = const Value.absent(),
  });
  WalletsCompanion.insert({
    @required int id,
    @required int userId,
    @required int currencyId,
    @required String currencyCode,
    @required String name,
    @required String description,
    @required String iban,
  })  : id = Value(id),
        userId = Value(userId),
        currencyId = Value(currencyId),
        currencyCode = Value(currencyCode),
        name = Value(name),
        description = Value(description),
        iban = Value(iban);
  static Insertable<Wallet> custom({
    Expression<int> id,
    Expression<int> userId,
    Expression<int> currencyId,
    Expression<String> currencyCode,
    Expression<String> name,
    Expression<String> description,
    Expression<String> iban,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (currencyId != null) 'currency_id': currencyId,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (iban != null) 'iban': iban,
    });
  }

  WalletsCompanion copyWith(
      {Value<int> id,
      Value<int> userId,
      Value<int> currencyId,
      Value<String> currencyCode,
      Value<String> name,
      Value<String> description,
      Value<String> iban}) {
    return WalletsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      currencyId: currencyId ?? this.currencyId,
      currencyCode: currencyCode ?? this.currencyCode,
      name: name ?? this.name,
      description: description ?? this.description,
      iban: iban ?? this.iban,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<int>(currencyId.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (iban.present) {
      map['iban'] = Variable<String>(iban.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WalletsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('currencyId: $currencyId, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('iban: $iban')
          ..write(')'))
        .toString();
  }
}

class $WalletsTable extends Wallets with TableInfo<$WalletsTable, Wallet> {
  final GeneratedDatabase _db;
  final String _alias;
  $WalletsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _currencyIdMeta = const VerificationMeta('currencyId');
  GeneratedIntColumn _currencyId;
  @override
  GeneratedIntColumn get currencyId => _currencyId ??= _constructCurrencyId();
  GeneratedIntColumn _constructCurrencyId() {
    return GeneratedIntColumn(
      'currency_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _currencyCodeMeta =
      const VerificationMeta('currencyCode');
  GeneratedTextColumn _currencyCode;
  @override
  GeneratedTextColumn get currencyCode =>
      _currencyCode ??= _constructCurrencyCode();
  GeneratedTextColumn _constructCurrencyCode() {
    return GeneratedTextColumn(
      'currency_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ibanMeta = const VerificationMeta('iban');
  GeneratedTextColumn _iban;
  @override
  GeneratedTextColumn get iban => _iban ??= _constructIban();
  GeneratedTextColumn _constructIban() {
    return GeneratedTextColumn(
      'iban',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, currencyId, currencyCode, name, description, iban];
  @override
  $WalletsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'wallets';
  @override
  final String actualTableName = 'wallets';
  @override
  VerificationContext validateIntegrity(Insertable<Wallet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id'], _currencyIdMeta));
    } else if (isInserting) {
      context.missing(_currencyIdMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
          _currencyCodeMeta,
          currencyCode.isAcceptableOrUnknown(
              data['currency_code'], _currencyCodeMeta));
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('iban')) {
      context.handle(
          _ibanMeta, iban.isAcceptableOrUnknown(data['iban'], _ibanMeta));
    } else if (isInserting) {
      context.missing(_ibanMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Wallet map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Wallet.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WalletsTable createAlias(String alias) {
    return $WalletsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  $WalletsTable _wallets;
  $WalletsTable get wallets => _wallets ??= $WalletsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, wallets];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$DaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $WalletsTable get wallets => attachedDatabase.wallets;
}
