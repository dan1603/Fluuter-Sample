import 'package:finance_flutter_app/db/tables.dart';
import 'package:finance_flutter_app/ui/login/login_screen.dart';
import 'package:finance_flutter_app/ui/wallet/bloc/wallet_cubit.dart';
import 'package:finance_flutter_app/utils/state_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/wallet_state.dart';

class WalletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
        onInit: () {
          context.read<WalletCubit>().getWallet();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocListener<WalletCubit, WalletState>(
              listener: (context, state) {
                switch (state.runtimeType) {
                  case SessionExpiredWalletState:
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => LoginScreen()
                    ));
                  break;
              }
          }, child: BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case InitialWalletState:
                  return _buildEmptyState();
                  break;
                case EmptyWalletState:
                  return _buildEmptyState();
                  break;
                case ContentWalletState:
                  ContentWalletState content = state as ContentWalletState;
                  print("${content.wallets}");
                  return _buildContent(content.wallets);
                  break;
                case ErrorWalletState:
                  ErrorWalletState errorState = state as ErrorWalletState;
                  return _buildError(errorState.errorMessage);
                  break;
                case LoadingWalletState:
                  return _buildLoading();
                  break;
                default:
                  return _buildEmptyState();
                  break;
              }
            },
          )),
        ));
  }

  Widget _buildError(String error) {
    return Center(
      child: Center(
        child: Text(
          error
        ),
      ),
    );
  }

  Widget _buildContent(List<Wallet> wallets) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: ListView.builder(
          itemCount: wallets.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(wallets[index]);
          }
        )
        )
      ],
    );
  }

  Widget _buildItem(Wallet wallet) {
    return SafeArea(child: GestureDetector(
      onTap: () {

      },
      child: Container(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.account_balance_wallet_outlined, size: 40.0),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                          child: Wrap(
                            direction: Axis.vertical,
                            spacing: 5,
                            children: [
                              Text(
                                wallet.name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                wallet.description,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                )
            ),
            Divider(),
          ],
        ),
      )
    ));
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 1,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Center(
        child: Text(
            "There is no wallets, why don\'t create one ?"
        ),
      ),
    );
  }
}