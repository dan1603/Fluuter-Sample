import 'package:finance_flutter_app/ui/login/model/login_response.dart';
import 'package:finance_flutter_app/ui/wallet/model/wallet_model.dart';

abstract class ApiContract {
  Future<LoginResponse> login(String username, String password);

  Future<WalletResponse> getWallet();
}