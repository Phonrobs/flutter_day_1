import 'package:flutter/material.dart';
import 'package:test_app1/pages/order.dart';
import 'package:test_app1/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State <HomePage> {
  var orders = ['ข้าวผัดกระเพรา', 'ผัดไทย', 'ก๋วยจั๊บ'];

  Widget buildOrderList(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(orders[index]));
      },
    );
  }

  void addOrder(String foodName) {
    setState(() {
      orders.add(foodName);
      print(orders);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: buildOrderList(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrderPage(addOrder)));
        },
      ),
    );
  }
}
