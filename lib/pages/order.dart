import 'package:flutter/material.dart';
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
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

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
          );
        });
  }

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
      );
    }
  }

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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    child: Text('Save'),
                    onPressed: () => onSave(context),
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
      appBar: AppBar(
        title: Text('New Order'),
      ),
      body: buildForm(context),
    );
  }
}
