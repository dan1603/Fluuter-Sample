import 'package:finance_flutter_app/api/api_manager.dart';
import 'package:finance_flutter_app/utils/constants.dart';
import 'package:finance_flutter_app/db/dao/user_dao.dart';
import 'package:finance_flutter_app/ui/login/model/login_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  String username;
  String password;

  final ApiManager apiManager;
  final UserDao userDao;

  LoginCubit(this.apiManager, this.userDao) : super(InitialLoginState());

  void login(String username, String password) async {
    emit(LoadingLoginState());
    List<String> validationErrors = validate(username, password);

    if (validationErrors != null) {
      emit(ErrorLoginState(validationErrors));
      return;
    }

    apiManager.login(username, password).then((LoginResponse response) async {
      if (response.isSuccessful) {
        await userDao.deleteAll();
        await userDao.insertCompanion(response.user);
        emit(SuccessfulLoginState());
      } else {
        emit(ErrorLoginState(List.from([response.error])));
      }
    });
  }

  List<String> validate(String username, String password) {
    if (username.isEmpty) {
      return List.from([Error.validationUsername]);
    } if (password.isEmpty) {
      return List.from([Error.validationPassword]);
    } if (username.isEmpty && password.isEmpty) {
      return List.from([Error.validationUsername, Error.validationPassword]);
    } else {
      return null;
    }
  }

  void setUsername(String username) {
    this.username = username;
  }

  void setPassword(String password) {
    this.password = password;
  }
}