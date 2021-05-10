import 'package:flutter/material.dart';

class AddContactForm extends StatelessWidget {
  final Function(String, String) onAddPressed;

  final TextEditingController nameC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();

  AddContactForm({Key key, @required this.onAddPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contact"),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: nameC,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: phoneC,
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            FlatButton(
              color: Colors.green,
              onPressed: () {
                onAddPressed(nameC.text, phoneC.text);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
