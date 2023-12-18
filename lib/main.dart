import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/provider/user_sigIn_provider.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/sign_in_component.dart';
import 'package:provider/provider.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/page/detail_kelas_page.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/page/home_page_view.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/presentation/page/my_class_page.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/page/lowongan_page.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/page/payment_page.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/card_course_info.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/card_payment.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/card_payment_detail.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/payment_choice_card.dart';
import 'package:flutter_fe_rpl/feature/payment/presentation/widget/payment_component.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/page/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserResponseProvider()),
      ],
      child: MaterialApp(
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          SignInView(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
