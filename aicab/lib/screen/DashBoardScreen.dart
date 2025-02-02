import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '/fragment/HomeFragment.dart';
import '/fragment/RegisterFragment.dart';
import '/fragment/PaymentFragment.dart';
import '/fragment/SupportFragment.dart';
import '/fragment/SubFragment.dart';
import '/fragment/ManageFragment.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    const RegisterFragment(), // PU 1 (zawodev)
    const HomeFragment(), // PU 2 (zawodev)
    const PaymentFragment(), // PU 3 (Kacper)
    const SupportFragment(), // PU 4 (Kacper)
    const SubFragment(), // PU 5 (Bartek)
    const ManageFragment(), // PU 6 (Bartek)
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    // Initialization logic if needed
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person_add_outlined), label: 'Rejestracja', activeIcon: Icon(Icons.person_add)),
          BottomNavigationBarItem(icon: Icon(Icons.local_taxi_outlined), label: 'Zamów', activeIcon: Icon(Icons.local_taxi)),
          BottomNavigationBarItem(icon: Icon(Icons.payment_outlined), label: 'Zapłać', activeIcon: Icon(Icons.payment)),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent_outlined), label: 'Wsparcie', activeIcon: Icon(Icons.support_agent)),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions_outlined), label: 'Subskrypcja', activeIcon: Icon(Icons.subscriptions)),
          BottomNavigationBarItem(icon: Icon(Icons.car_repair_outlined), label: 'Status', activeIcon: Icon(Icons.car_repair)),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: const Color(0xff9e9e9e),
        selectedItemColor: context.iconColor,
        iconSize: 24,
        selectedFontSize: 14,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedFontSize: 14,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
      ),
      body: tabs[selectedIndex],
    );
  }
}