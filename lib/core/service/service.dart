import 'dart:io';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:quranapp/core/service/prayer_time_service.dart';
import 'package:flutter/material.dart';



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
        context.read<PrayerTimeService>().fetchPrayerTimes();
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
