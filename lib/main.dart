import 'package:e_commerce_app/product_details_view/product_details_view.dart';
import 'package:e_commerce_app/splash/splash_screen.dart';
import 'package:e_commerce_app/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen/homeScreen.dart';
import 'login/login_screen.dart';
import 'my_bloc_observer.dart';
import 'register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceUtils.init();
  String route;
  var token = SharedPreferenceUtils.getData(key: 'token');
  if (token == null) {
    route = LoginScreen.routeName;
  } else {
    route = HomeScreen.routeName;
  }
  runApp(MyApp(route: route));
}

class MyApp extends StatelessWidget {
  String route;
  MyApp({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: route,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              ProductDetailsView.routName: (context) => HomeScreen(),
            },
          );
        });
  }
}
