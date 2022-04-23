import 'package:car_inspection/app/modules/home/submodules/inspectionlist/inspection_list_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        body: const RouterOutlet(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: Observer(
          builder: (_) {
            return BottomNavigationBar(
                onTap: (index) {
                  setState(() {
                    store.currentIndex = index;
                  });
                  if (index == 0) {
                    Modular.to.pushNamed('/home/inspectionlist/');
                  } else if (index == 1) {
                    Modular.to.pushNamed('/home/profile/');
                  }
                },
                currentIndex: store.currentIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: 'Inspections'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ]);
          },
        ));
  }
}
