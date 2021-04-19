import 'dart:convert';

import 'package:finance_flutter_app/api/api_contract.dart';
import 'package:finance_flutter_app/utils/constants.dart';
import 'package:finance_flutter_app/db/tables.dart';
import 'package:finance_flutter_app/ui/login/model/login_response.dart';
import 'package:finance_flutter_app/ui/wallet/model/wallet_model.dart';
import 'package:finance_flutter_app/utils/cookies.dart';
import 'package:finance_flutter_app/utils/preferences.dart';
import 'package:http/http.dart' as http;

class ApiManager implements ApiContract {

  @override
  Future<LoginResponse> login(String username, String password) async {
    var form = new Map<String, dynamic>();
    form['username'] = username;
    form['password'] = password;
    print("[HTTP] --> ${Api.login}\n$form");

    http.Response response = await http.post(Api.login, body: form);
    var body = jsonDecode(response.body);
    var code = response.statusCode;
    print("[HTTP] <-- $code ${Api.login}\n${response.body}");

    if (code == Api.codeSuccess) {
      SharedPreferencesManager().setUserId(body['id']);
      SharedPreferencesManager().onAuth();
      Cookies().save(response);
      UsersCompanion user = UsersCompanion.insert(
          username: body['username'] ?? ''
      );
      return LoginResponse(true, user: user);
    } else {
      SharedPreferencesManager().onLogout();
      return LoginResponse(false, error: body['message'] ?? Error.errorLogin);
    }
  }

  @override
  Future<WalletResponse> getWallet() async {
    int userId = await SharedPreferencesManager().getUserId();
    String requestUrl = Api.getWallets(userId);
    Map<String, String> headers = await Cookies().get();
    print("[HTTP] --> $requestUrl\n$headers");

    http.Response response = await http.get(requestUrl, headers: headers);
    var body = jsonDecode(response.body);
    var code = response.statusCode;
    print("[HTTP] <-- $code $requestUrl\n${response.body}");

    switch (code) {
      case Api.codeSuccess:
        WalletResponseWrapper wrapper = WalletResponseWrapper.fromJson(body);
        return WalletResponse(true, wallets: wrapper.records);
        break;
      case Api.codeSessionExpired:
        return WalletResponse(false, isSessionExpired: true);
        break;
      default:
        return WalletResponse(false, error: body['message'] ?? Error.errorLogin);
        break;
    }
  }

}