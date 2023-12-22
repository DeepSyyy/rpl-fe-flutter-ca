import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/widget/navbar_admin.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageNavbar(),
    );
  }
}
