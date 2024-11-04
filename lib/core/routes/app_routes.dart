

import 'package:flutter/material.dart';
import 'package:quranapp/featuers/home/presentation/view/qibla_view.dart';

class AppRoute {
  static const qiblahScreen = 'QiblahScreen';
  static const profileScreen = 'ProfileScreen';
  static const splashScreen = 'SplashScreen';
  static const signUpScreen = 'SignUpScreen';
  static const homescreen = 'HomeScreen';
  static const onBoardingScreen = 'OnBoardingScreen';
  static const favoriteScreen = 'FavoriteScreen';
  static const categoryScreen = 'CategoryScreen';
  static const cartScreen = 'CartScreen';
  static const forgetPassWordScreen = 'ForgotPasswordScreen';
  static const layoutScreen = 'HomeNavBarWidget3';
  static const otpScreen = 'OtpScreen';
  static const updateDataScreen = 'UpdateDataScreen';
  static const changePasswordScreen = 'ChangePasswordScreen';
  static const darkAndLightView = 'DarkAndLightView';

  static const loginSuccess = 'LoginSuccessScreen';
  static const detailsScreen = 'DetailsScreen';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return SizeTransition3( QiblahScreen());
      // case onBoardingScreen:
      //   return SizeTransition3(const OnBoardingScreen());
      // case signUpScreen:
      //   return SizeTransition3(BlocProvider(
      //     create: (context) => AuthSignUpCubit(),
      //     child: const SignUpScreen(),
      //   ));
      // case signInScreen:
      //   return SizeTransition3(BlocProvider(
      //     create: (context) => AuthSignUpCubit(),
      //     child: const SignInScreen(),
      //   ));

    

     
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text('noRouteFound'),
            ),
          )),
    );
  }
}

class SizeTransition3 extends PageRouteBuilder {
  final Widget page;

  SizeTransition3(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(seconds: 4),
          reverseTransitionDuration: const Duration(seconds: 2),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}

class SizeTransition5 extends PageRouteBuilder {
  final Widget page;

  SizeTransition5(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(seconds: 2),
          // reverseTransitionDuration:const  Duration(seconds: 2),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return Align(
              alignment: Alignment.centerRight,
              child: SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}
