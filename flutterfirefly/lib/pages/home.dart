import 'package:flutter/material.dart';
import '../api/stellar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [accountView(), balancesView(context)]);
  }

  accountView() {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: Text(ACCOUNTID),
    );
  }

  balancesView(BuildContext context) {
    return FutureBuilder(
      builder: _balancesViewBuilder,
    );
  }

  Widget _balancesViewBuilder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return null;
    }

    Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
      print(snapshot);
      List balances = snapshot.data['balances'];
      return ListView.builder(
        itemBuilder: (context, index) => _itemBuilder(context, index, balances),
        itemCount: balances.length * 2,
      );
    }

    Widget _itemBuilder(BuildContext context, int index, balances) {
      if (index.isOdd) {
        return Divider();
      }
      index = index ~/ 2;
      return ListTile(
        title: Text(balances[index]['asset_code'] == null ? 'XLM' : balances[index]['asset_code']),
        leading: Text(balances[index]['balance'])
      );
    }
  }
}
