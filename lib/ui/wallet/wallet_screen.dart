import 'package:finance_flutter_app/api/api_contract.dart';
import 'package:finance_flutter_app/db/dao/wallet_dao.dart';
import 'package:finance_flutter_app/db/tables.dart';
import 'package:finance_flutter_app/ui/wallet/bloc/wallet_cubit.dart';
import 'package:finance_flutter_app/ui/wallet/wallet_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WalletCubit(
          context.read<ApiContract>(), WalletDao(context.read<AppDatabase>())),
      child: WalletView(),
    );
  }
}