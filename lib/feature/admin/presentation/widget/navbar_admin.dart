import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/widget/admin_component.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/widget/admin_loker_component.dart';

class PageNavbar extends StatefulWidget {
  const PageNavbar({super.key});

  @override
  State<PageNavbar> createState() => _PageNavbarState();
}

class _PageNavbarState extends State<PageNavbar> {
  int _selectedIndex = 0;
  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [const AdminCourseComponent(), const AdminLokerComponent()]
            .elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: const Icon(Icons.book),
                tooltip: "Course",
                label: 'Course'),
            BottomNavigationBarItem(
                icon: const Icon(Icons.work), tooltip: "Loker", label: 'Loker'),
          ],
          currentIndex: _selectedIndex,
          onTap: _itemTapped,
        ));
  }
}
