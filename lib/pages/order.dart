import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:http/http.dart' as http;
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d
import 'package:test_app1/models/menu.dart';

class OrderPage extends StatefulWidget {
  final Function addOrder;
  final List<Menu> menus;

  OrderPage(this.addOrder, this.menus);

  @override
  OrderPageState createState() {
    return OrderPageState();
  }
}

class OrderPageState extends State<OrderPage> {
  var quantityController = TextEditingController();
<<<<<<< HEAD
  var phoneController = TextEditingController();
=======
  var telephoneController = TextEditingController();
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d

  var formKey = GlobalKey<FormState>();
  Menu selectedMenu = null;

<<<<<<< HEAD
  int selectedMenuId;

  @override
  void initState() {
    super.initState();

    selectedMenuId = 0;
  }

  Widget buildMenuItem(BuildContext context, Menu item) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.network(
              item.imageUrl,
              height: 100.0,
            ),
            Text(item.name),
            Text(item.price.toString() + ' บาท'),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          selectedMenuId = item.menuId;
        });

        Navigator.pop(context);
      },
    );
  }

  void selectMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return GridView.count(
            crossAxisCount: 2,
            children: widget.menus
                .map<Widget>((item) => buildMenuItem(context, item))
                .toList(),
=======
  Future<List<Menu>> getMenus() async {
    String url = 'http://app.up.ac.th/uappservices/api/menus';

    var response = await http.get(url);

    print(response.body);

    var jsonDecoded = json.decode(response.body);
    var menus = jsonDecoded.map<Menu>((json) => Menu.fromJson(json)).toList();

    return menus;
  }

  void showMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FutureBuilder(
            future: getMenus(),
            builder: (context, AsyncSnapshot<List<Menu>> snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                  padding: EdgeInsets.only(top: 20.0),
                  crossAxisCount: 2,
                  children: snapshot.data.map<Widget>((item) {
                    return GestureDetector(
                      child: Column(
                        children: [
                          Image.network(
                            item.imageUrl,
                            height: 100.0,
                          ),
                          Text(item.name),
                          Text('ราคา ' + item.price.toString() + ' บาท')
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          selectedMenu = item;
                        });

                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d
          );
        });
  }

<<<<<<< HEAD
  Widget buildSelectMenuButton() {
    if (selectedMenuId == 0) {
      return OutlineButton(
        borderSide: BorderSide(color: Colors.orange),
        child: Text(
          'Select a menu...',
          style: TextStyle(color: Colors.orange),
        ),
        onPressed: () => selectMenu(context),
      );
    } else {
      var menu = widget.menus.singleWhere((item) => item.menuId == selectedMenuId);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(menu.imageUrl, height: 100.0),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menu.name,
                  style: TextStyle(fontSize: 22.0),
                ),
                Text(menu.price.toString() + ' บาท'),
              ],
            ),
          ),
        ],
=======
  Widget buildMenuButton(BuildContext context) {
    if (selectedMenu == null) {
      return Padding(
          padding: EdgeInsets.all(20.0),
          child: OutlineButton(
            child: Text('Select a menu'),
            onPressed: () => showMenu(context),
          ));
    } else {
      return Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image.network(selectedMenu.imageUrl, height: 100.0),
            Text(selectedMenu.name),
            Text(selectedMenu.price.toString() + ' บาท')
          ],
        ),
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d
      );
    }
  }

<<<<<<< HEAD
  void onSave(BuildContext context) {
    if (formKey.currentState.validate()) {
      widget.addOrder(selectedMenuId, int.parse(quantityController.text), phoneController.text);
      Navigator.pop(context);
    }
  }

  Form buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildSelectMenuButton(),
            TextFormField(
              controller: quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please input quantity';
                }
              },
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please input correct phone number';
                }
              },
=======
  Future saveOrder() async {
    
  }

  Widget buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            buildMenuButton(context),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                controller: quantityController,
                decoration: InputDecoration(labelText: 'จำนวนที่สั่ง (จาน)'),
                autofocus: true,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดกรอกจำนวนให้ถูกต้อง';
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                controller: telephoneController,
                decoration: InputDecoration(labelText: 'หมายเลขโทรศัพท์'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดกรอกหมายเลขโทรศัพท์ให้ถูกต้อง';
                  }
                },
              ),
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text('Save'),
<<<<<<< HEAD
                    onPressed: () => onSave(context),
=======
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        Navigator.pop(context);
                      }
                    },
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: Text('New Order'),
      ),
      body: buildForm(context),
    );
=======
        appBar: AppBar(
          title: Text('New Order'),
        ),
        body: buildForm(context));
>>>>>>> 3763a8547a8e6b084fa170a07cd6c1e2774d574d
  }
}
