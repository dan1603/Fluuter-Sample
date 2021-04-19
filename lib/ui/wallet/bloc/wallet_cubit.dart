import 'package:finance_flutter_app/api/api_manager.dart';
import 'package:finance_flutter_app/db/dao/wallet_dao.dart';
import 'package:finance_flutter_app/db/tables.dart';
import 'package:finance_flutter_app/ui/wallet/bloc/wallet_state.dart';
import 'package:finance_flutter_app/ui/wallet/model/wallet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletCubit extends Cubit<WalletState> {
  final ApiManager apiManager;
  final WalletDao dao;

  WalletCubit(this.apiManager, this.dao) : super(InitialWalletState());

  void getWallet() async {
    emit(LoadingWalletState());

    apiManager.getWallet().then((WalletResponse response) async {
      if (response.isSuccessful) {
        if (response.wallets.isNotEmpty) {
          emit(ContentWalletState(response.wallets));
        } else {
          emit(EmptyWalletState());
        }
      } else {
        if (response.isSessionExpired) {
          emit(SessionExpiredWalletState());
        } else {
          emit(ErrorWalletState(response.error));
        }
      }
    });
  }
}