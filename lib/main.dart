import 'package:flutter/material.dart';
import 'add_contact_form.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      // home: AddContactForm(),
    );
  }
}

class Contact {
  String name;
  String phone;
  String imagePath;

  Contact(this.name, this.phone, this.imagePath);
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [
    Contact("Sushan Shakya", "989088098",
        "https://reqres.in/img/faces/7-image.jpg"),
    Contact("Someone", "1231", "https://reqres.in/img/faces/8-image.jpg"),
    Contact("Ram", "12312", "https://reqres.in/img/faces/9-image.jpg"),
    Contact("Hari", "876231", "https://reqres.in/img/faces/10-image.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext ctx) => AddContactForm(
                onAddPressed: (name, phone) {
                  print("Add Pressedd");
                  print(name);
                  print(phone);
                  Contact newContact = Contact(
                    name,
                    phone,
                    "https://reqres.in/img/faces/11-image.jpg",
                  );

                  contacts.add(newContact);
                  Navigator.pop(ctx);
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            contacts.length,
            (index) => _contact(
              contacts[index].name,
              contacts[index].phone,
              contacts[index].imagePath,
            ),
          ),
        ),
      ),
    );
  }

  _contact(name, phone, image) => Padding(
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          leading: CircleAvatar(
            maxRadius: 20,
            backgroundImage: NetworkImage(
              image,
            ),
          ),
          title: Text(name),
          subtitle: Text(phone),
        ),
      );
}
