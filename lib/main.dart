import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fe_rpl/core/auth/users.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_course_provider.dart';
import 'package:flutter_fe_rpl/feature/admin/presentation/provider/admin_loker_provider.dart';
import 'package:flutter_fe_rpl/feature/detail_kelas/presentation/provider/detail_course_provider.dart';
import 'package:flutter_fe_rpl/feature/detail_lowongan/presentation/provider/detail_lowongan_provider.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/data/datasource/edit_user_profile_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/data/repository/edit_profile_user_repository_impl.dart';
import 'package:flutter_fe_rpl/feature/edit_profile/presentation/provider/edit_profile_provider.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/provider/course_user_provider.dart';
import 'package:flutter_fe_rpl/feature/kelas_saya/presentation/provider/my_course_provider.dart';
import 'package:flutter_fe_rpl/feature/lowongan/presentation/provider/lowongan_provider.dart';
import 'package:flutter_fe_rpl/feature/play_kelas/presentation/provider/play_kelas_provider.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/datasource/user_remote_data_source.dart';
import 'package:flutter_fe_rpl/feature/sign_in/data/repository/user_repository_impl.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/provider/user_sigIn_provider.dart';
import 'package:flutter_fe_rpl/feature/sign_up/data/repository/sign_up_repository_impl.dart';
import 'package:flutter_fe_rpl/feature/sign_up/presentation/provider/sign_up_user_provider.dart';
import 'package:flutter_fe_rpl/feature/sign_up/data/datasource/sign_up_remote_datasource.dart';
import 'package:flutter_fe_rpl/feature/transaksi/presentation/provider/transaksi_provider.dart';
import 'package:flutter_fe_rpl/feature/wishlist/presentation/provider/wishlist_provider.dart';
import 'package:flutter_fe_rpl/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fe_rpl/feature/home/presentation/page/home_page_view.dart';
import 'package:flutter_fe_rpl/feature/sign_in/presentation/page/sign_in_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.setSettings(
    appVerificationDisabledForTesting: true,
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
  final EditProfileUserRepositoryImpl editProfileRepositryImpl =
      EditProfileUserRepositoryImpl(
    editProfileUserDataSource: EditProfileUserRemoteDataSourceImpl(),
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
        ChangeNotifierProvider(create: (context) => AdminLokerProvider()),
        ChangeNotifierProvider(create: (context) => CourseUserProvider()),
        ChangeNotifierProvider(create: (context) => DetailCourseProvider()),
        ChangeNotifierProvider(create: (context) => LowonganProvider()),
        ChangeNotifierProvider(
          create: (context) => DetailLowonganProvider(),
        ),
        ChangeNotifierProvider(create: (context) => AuthUserProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => MyCourseProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => PlayKelasProvider()),
        ChangeNotifierProvider(
            create: (context) => EditProfileProvider(
                editProfileUserRepositoryImpl: editProfileRepositryImpl)),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.hasData) {
                return const HomePageView();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return const SignInPage();
            },
          ),
        ),
      ),
    );
  }
}
