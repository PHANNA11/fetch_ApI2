import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_api_flutter_app/view/post_screen.dart';
import 'package:test_api_flutter_app/view/product_screen.dart';
import 'package:test_api_flutter_app/view/todos_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List listMenusApi = ['Todos List', 'Post API', 'Products API'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Intergration'),
      ),
      body: ListView.builder(
        itemCount: listMenusApi.length,
        itemBuilder: (context, index) {
          return buildMenuApp(title: listMenusApi[index], index: index);
        },
      ),
    );
  }

  Widget buildMenuApp({required String title, required int index}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodosScreen(),
                ));
          } else if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostScreen(),
                ));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(),
                ));
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
