import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class Contact {
  String name;
  String phone;

  Contact(this.name, this.phone);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Contact> contacts = [
    Contact("Sushan Shakya", "989088098"),
    Contact("Someone", "1231"),
    Contact("Ram", "12312"),
    Contact("Hari", "876231"),
  ];

  @override
  void initState() {    
    super.initState();
    Dio()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            contacts.length,
            (index) => _contact(contacts[index].name, contacts[index].phone),
          ),
        ),
      ),
    );
  }

  _contact(name, phone) => Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
            ),
            title: Text(name),
            subtitle: Text(phone)),
      );
}
