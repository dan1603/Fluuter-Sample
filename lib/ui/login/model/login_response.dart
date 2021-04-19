import 'package:finance_flutter_app/api/api_response.dart';
import 'package:finance_flutter_app/db/tables.dart';

class LoginResponse extends ApiResponse {
  UsersCompanion user;

  LoginResponse(bool isSuccessful, {String error, this.user}) : super(isSuccessful, error: error);
}