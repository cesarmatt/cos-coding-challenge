import 'package:car_inspection/app/modules/home/submodules/inspectionlist/inspection_list_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: store.pageViewController,
        children: [
          RouterOutlet(),
          RouterOutlet()
        ],
      ),
      appBar: AppBar(
        title: const Text('Car Inspection'),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: store.pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
                currentIndex: store.pageViewController.page?.round() ?? 0,
                onTap: (index) {
                  store.pageViewController.jumpToPage(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: 'Inspections'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ]);
          }),
    );
  }
}
