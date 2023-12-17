import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/widget/home_page_component.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/presentation/page/my_class_page.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/page/lowongan_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBarComponent extends StatefulWidget {
  const NavigationBarComponent({super.key});

  @override
  State<NavigationBarComponent> createState() => _NavigationBarComponentState();
}

class _NavigationBarComponentState extends State<NavigationBarComponent> {
  int _selectedIndex = 0;
  void _itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomePage(),
        LowonganPage(),
        MyClassPage(),
        const Text('Profil'),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/home-icon.svg",
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg/home-icon-filled.svg",
              ),
              tooltip: "Beranda",
              label: 'Beranda'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/bot-icon.svg"),
              activeIcon: SvgPicture.asset("assets/svg/bot-icon-filled.svg"),
              tooltip: "Ze AI",
              label: 'Ze AI'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/book-icon.svg"),
              activeIcon: SvgPicture.asset("assets/svg/book-icon-filled.svg"),
              tooltip: "Kelas",
              label: 'Kelas'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/person-icon.svg"),
              activeIcon: SvgPicture.asset("assets/svg/person-icon-filled.svg"),
              tooltip: "Profil",
              label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        selectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        showUnselectedLabels: true,
        unselectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        unselectedItemColor: const Color(0xFF7B8CB5),
        selectedItemColor: const Color(0xFF4F46E5),
        onTap: _itemTapped,
      ),
    );
  }
}
