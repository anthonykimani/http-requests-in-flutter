import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:network_app/components/data_from_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.blue,
        leading:IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        title:Text("Arasaka Properties"),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Homes"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: "Favourites"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: "Notifications")
      ]),
      body: DataFromAPI(),
    );
  }
}