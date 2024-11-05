import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:quranapp/core/widgets/brain.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/featuers/home/data/model/calss_model.dart';
import 'package:quranapp/featuers/home/data/model/sahih_model.dart';



Future<List<Class>> fetchClasses() async {
  String jsonString = await rootBundle.loadString('assets/books/altib.json');
  final jsonResult = jsonDecode(jsonString);
  return (jsonResult['class'] as List)
      .map((i) => Class.fromJson(i as Map<String, dynamic>))
      .toList();
} 
Future<List<SahihBukhariModels>> fetchAllSahihBukari() async {
  String jsonString = await rootBundle.loadString('assets/books/sahih_al_bukhari.json');
  final jsonResult = jsonDecode(jsonString);
  return (jsonResult['sahihAllBukhari'] as List)
      .map((i) => SahihBukhariModels.fromJson(i as Map<String, dynamic>))
      .toList();
} 





class LocationService {
  loc.Location location = loc.Location();

  Future<bool> requestLocationPermission(BuildContext context) async {
    try {
      // طلب إذن الموقع
      PermissionStatus permissionStatus = await Permission.location.request();

      // تحقق من الاتصال بالإنترنت
      bool isConnected = await _checkInternetConnection();

      if (permissionStatus == PermissionStatus.granted && isConnected) {
        print("Location permission granted and internet connected!");
        // استدعاء دالة fetchPrayerTimes بعد التأكد من تهيئة المتغيرات اللازمة
        context.read<Brain>().fetchPrayerTimes();
        return true;
      } else {
        print("Permission denied or no internet connection!");
        // هنا يمكنك عرض رسالة للمستخدم بدلاً من إعادة المحاولة مباشرةً
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _checkInternetConnection() async {
    try {
      var result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      print("No internet connection: $e");
      return false;
    }
  }
}
