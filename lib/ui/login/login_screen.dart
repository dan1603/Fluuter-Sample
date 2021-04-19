import 'package:finance_flutter_app/api/api_contract.dart';
import 'package:finance_flutter_app/db/dao/user_dao.dart';
import 'package:finance_flutter_app/db/tables.dart';
import 'package:finance_flutter_app/ui/login/bloc/login_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_view.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
          context.read<ApiContract>(), UserDao(context.read<AppDatabase>())),
      child: LoginView(),
    );
  }
}
