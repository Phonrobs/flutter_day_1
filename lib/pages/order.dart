import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_app1/models/menu.dart';

class OrderPage extends StatefulWidget {
  Function addOrder;

  OrderPage(this.addOrder);

  @override
  OrderPageState createState() {
    return OrderPageState();
  }
}

class OrderPageState extends State<OrderPage> {
  var foodNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var menuIndex = -1;

  Future<List<Menu>> getMenus() async {
    String url = 'http://app.up.ac.th/uappservices/api/menus';

    var response = await http.get(url);

    print(response.body);

    return [];
  }

  void showMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FutureBuilder(
            future: getMenus(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('OK');
              } 
              else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        });
  }

  Widget buildMenuButton(BuildContext context) {
    if (menuIndex == -1) {
      return Padding(
          padding: EdgeInsets.all(20.0),
          child: OutlineButton(
            child: Text('Select a menu'),
            onPressed: () => showMenu(context),
          ));
    } else {
      return Container();
    }
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
                controller: foodNameController,
                decoration: InputDecoration(labelText: 'ชื่ออาหาร'),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดกรอกชื่ออาหารให้ถูกต้อง';
                  }
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: OutlineButton(
                    child: Text('Save'),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        widget.addOrder(foodNameController.text);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: OutlineButton(
                    child: Text('Cancel'),
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
        appBar: AppBar(
          title: Text('New Order'),
        ),
        body: buildForm(context));
  }
}
