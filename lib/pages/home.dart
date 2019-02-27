import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app1/config.dart';
import 'package:test_app1/models/menu.dart';
import 'package:test_app1/models/order.dart';
import 'package:test_app1/pages/order.dart';
import 'package:test_app1/widgets/main_drawer.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Order> orders = [];
  List<Menu> menus = [];
  bool loaded = false;

  Future getMenus() async {
    var url = Config.appServiceUrl + '/api/menus';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodeJson = json.decode(response.body);
      menus = decodeJson.map<Menu>((json) => Menu.fromJson(json)).toList();
    } else {
      print(response.body);
    }
  }

  Future<List<Order>> getOrders() async {
    if (loaded) {
      return orders;
    }

    await getMenus();

    var url = Config.appServiceUrl + '/api/orders/' + Config.username;
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var decodeJson = json.decode(response.body);
      orders = decodeJson.map<Order>((json) => Order.fromJson(json)).toList();
    } else {
      print(response.body);
    }

    loaded = true;

    return orders;
  }

  Widget buildOrderList(BuildContext context) {
    return FutureBuilder<List<Order>>(
        future: getOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                var menu = menus
                    .singleWhere((item) => item.menuId == orders[index].menuId);
                return ListTile(
                  leading: Icon(Icons.restaurant),
                  title: Text(menu.name),
                  subtitle: Text(orders[index].quantity.toString() +
                      ' จาน ' +
                      orders[index].totalPrice.toString() +
                      ' บาท'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_forever),
                    onPressed: () => deleteOrder(index),
                  ),
                  onTap: () {},
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  void addOrder(int menuId, int quantity, String telephone) {
    var menu = menus.singleWhere((item) => item.menuId == menuId);

    var totalPrice = quantity * menu.price;

    var newOrder = Order(
        orderId: 0,
        menuId: menuId,
        username: Config.username,
        quantity: quantity,
        totalPrice: totalPrice,
        telephone: telephone);

    var url = Config.appServiceUrl + '/api/orders';

    var encodedJson = json.encode(newOrder.toJson());

    http.post(url,
        body: encodedJson,
        headers: {'Content-Type': 'application/json'}).then((response) {
      print(response.body);
    }, onError: () {
      print('Error!');
    });

    setState(() {
      orders.add(newOrder);
    });
  }

  void deleteOrder(int index) {
    var url = Config.appServiceUrl + '/api/orders/' + orders[index].orderId.toString();

    http.delete(url, headers: {'Content-Type': 'application/json'}).then(
        (response) {
      print(response.body);
    }, onError: () {
      print('Error!');
    });

    setState(() {
      orders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('My Orders'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {},
          )
        ],
      ),
      body: buildOrderList(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderPage(addOrder, menus)));
        },
      ),
    );
  }
}
