import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/feature/admin/data/datasource/course_admin_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/admin/data/repository/course_admin_repository_impl.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_course_provider.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/widget/admin_add_course_component.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/widget/admin_component.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/datasource/user_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/repository/user_repository_impl.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/provider/user_sigIn_provider.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/widget/sign_in_component.dart';
import 'package:flutter_fe_rpl/feature/sign_up/data/repository/sign_up_repository_impl.dart';
import 'package:flutter_fe_rpl/feature/sign_up/presentation/provider/sign_up_user_provider.dart';
import 'package:flutter_fe_rpl/feature/sign_up/presentation/widget/sign_up_component.dart';
import 'package:flutter_fe_rpl/feature/sign_up/data/datasource/sign_up_remote_datasource.dart';
import 'package:flutter_fe_rpl/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  final UserRepositoryImpl userRepo = UserRepositoryImpl(
    userRemoteDataSource: UserRemoteDataSourceImpl(),
  );

  final SignUpRepositoryImpl signUpRepo = SignUpRepositoryImpl(
    signUpRemoteDataSource: SignUpRemoteDataSourceImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                UserResponseProvider(userRepositoryImpl: userRepo)),
        ChangeNotifierProvider(
            create: (context) =>
                SignUpUserProvider(signUpRepositoryImpl: signUpRepo)),
        ChangeNotifierProvider(create: (context) => AdminCourseProvider()),
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
          AdminCourseComponent(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
