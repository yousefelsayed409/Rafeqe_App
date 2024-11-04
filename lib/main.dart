import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart'; 
import 'package:provider/provider.dart';
import 'package:quranapp/core/widgets/brain.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quranapp/featuers/home/presentation/manger/Books_cubit/books_cubit.dart';
import 'package:quranapp/featuers/home/presentation/manger/azkar_cubit/azkar_cubit.dart';
import 'package:quranapp/featuers/home/splash/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ar', null);

  runApp(const Quranapp());
}

class Quranapp extends StatelessWidget {
  const Quranapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Brain()),
        BlocProvider(create: (_) => AzkarCubit()),
        BlocProvider<BooksCubit>(
          create: (BuildContext context) => BooksCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashView(),
          );
        },
      ),
    );
  }
}
