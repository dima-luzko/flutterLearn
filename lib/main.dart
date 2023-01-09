import 'package:flutter/material.dart';
import 'package:practice_app/screen/catalog.dart';
import 'package:practice_app/widgets/button_widgets.dart';
import 'package:practice_app/widgets/change_count_button_widget.dart';
import 'package:practice_app/widgets/count_state_widget.dart';
import 'package:practice_app/widgets/general_count_widget.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RootWidget());
  }
}

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int count = 0;
  int global = 10;

  void addCounter() {
    setState(() {
      if (count != 10) {
        count++;
        global--;
      }
    });
  }

  void removeCounter() {
    setState(() {
      if (count > 0) {
        count--;
        global++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CountState(
        count: count,
        global: global,
        incrementer: addCounter,
        decrementer: removeCounter,
        child: const InheritedWidgetDemo());
  }
}

class InheritedWidgetDemo extends StatefulWidget {
  const InheritedWidgetDemo({super.key});

  @override
  State<InheritedWidgetDemo> createState() => _InheritedWidgetDemo();
}

class _InheritedWidgetDemo extends State<InheritedWidgetDemo> {
  int _selectedIndex = 0;

  final List<Widget> _widgets = [
    const Text("Смена",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
    const CatalogScreen(),
    const Text(
      "Продажи",
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgets[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Смена',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart_sharp),
            label: 'Продажи',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
