import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/screen/sales_screen.dart';
import 'package:practice_app/screen/university.dart';

import '../counter_cubit.dart';
import '../user_model.dart';
import 'catalog.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key, required this.userData}) : super(key: key);

  final User userData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BottomNavBarWidget(user: userData),
    );
  }
}

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidget();
}

class _BottomNavBarWidget extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> screens = [
      const UniversityStateWidget(),
      const CatalogScreen(),
      SalesScreen(userModel: widget.user)
    ];

    return Scaffold(
      body: Center(child: screens[_selectedIndex]),
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
