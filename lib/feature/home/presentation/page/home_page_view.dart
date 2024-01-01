import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/widget/navbar_component.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key, this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return const NavigationBarComponent();
  }
}
