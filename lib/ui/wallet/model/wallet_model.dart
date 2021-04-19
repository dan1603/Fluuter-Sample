import 'package:finance_flutter_app/api/api_response.dart';
import 'package:finance_flutter_app/db/tables.dart';

class WalletResponse extends ApiResponse {
  List<Wallet> wallets;

  WalletResponse(bool isSuccessful,
      {String error, bool isSessionExpired, this.wallets})
      : super(isSuccessful, error: error, isSessionExpired: isSessionExpired);
}

class WalletResponseWrapper {
  final List<Wallet> records;

  WalletResponseWrapper(this.records);

  WalletResponseWrapper.fromJson(Map<String, dynamic> json)
      : records = (json["records"] as List).map((e) => Wallet(
      id: e['id'],
      userId: e['user_id'],
      currencyId: e['currency_id']['id'],
      currencyCode: e['currency_id']['code'],
      name: e['name'],
      description: e['description'],
      iban: e['iban']
  )).toList();
}
