import 'package:finance_flutter_app/db/tables.dart';

abstract class WalletState {}

class InitialWalletState extends WalletState {}

class EmptyWalletState extends WalletState {}

class LoadingWalletState extends WalletState {}

class ErrorWalletState extends WalletState {
  final String errorMessage;

  ErrorWalletState(this.errorMessage);
}

class SessionExpiredWalletState extends WalletState {}

class ContentWalletState extends WalletState {
  final List<Wallet> wallets;

  ContentWalletState(this.wallets);
}