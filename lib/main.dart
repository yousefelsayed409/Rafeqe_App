import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart'; 
import 'package:provider/provider.dart';
import 'package:quranapp/core/routes/app_routes.dart';
import 'package:quranapp/core/service/prayer_time_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quranapp/featuers/home/presentation/manger/Books_cubit/books_cubit.dart';
import 'package:quranapp/featuers/home/presentation/manger/azkar_cubit/azkar_cubit.dart';
import 'featuers/home/presentation/manger/quran_azkar_cubit/quran_azkar_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ar', null);

  runApp(const RafeqeApp());
}

class RafeqeApp extends StatelessWidget {
  const RafeqeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PrayerTimeService()),
        BlocProvider(create: (_) => AzkarCubit()),
        BlocProvider<BooksCubit>(
          create: (BuildContext context) => BooksCubit(),
        ),
         BlocProvider<QuranAzkarCubit>(
      create: (BuildContext context) => QuranAzkarCubit()..loadData(),
    ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            initialRoute:AppRoute.splashView ,
            onGenerateRoute: AppRoute.generateRoute ,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
