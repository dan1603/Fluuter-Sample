import 'package:finance_flutter_app/ui/wallet/wallet_screen.dart';
import 'package:finance_flutter_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;

  //ToDo refactor
  List<Widget> _tabs = [
    Container(
      child: Text("tab1"),
    ),
    WalletScreen(),
    Container(
      child: Text("tab3"),
    )
  ];

  List<BottomNavigationBarItem> _bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: Strings.tabHome),
    BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: Strings.tabWallet),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: Strings.tabProfile),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_bottomItems[_currentTab].label),
      ),
      body: _tabs[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentTab = index;
          });
        },
        currentIndex: _currentTab,
        items: _bottomItems,
      ),
    );
  }
}
