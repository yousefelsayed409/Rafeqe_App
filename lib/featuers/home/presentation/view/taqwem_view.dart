import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';

class HijriGregorianCalendarView extends StatefulWidget {
  @override
  _HijriGregorianCalendarViewState createState() => _HijriGregorianCalendarViewState();
}

class _HijriGregorianCalendarViewState extends State<HijriGregorianCalendarView> {
  late String _gregorianDate;
  late String _hijriDate;
  late String _currentDay;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();

    // تهيئة التاريخ الميلادي بصيغة عربية
    _gregorianDate = DateFormat.yMMMMEEEEd('ar').format(now);
    _currentDay = DateFormat.EEEE('ar').format(now); // الحصول على اليوم بصيغة عربية

    // تهيئة التاريخ الهجري بصيغة عربية باستخدام مكتبة hijri
    final hijri = HijriCalendar.fromDate(now);
    _hijriDate = '${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear} هـ'; // التاريخ الهجري باللغة العربية
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('التقويم الهجري والميلادي', style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              'اليوم: $_currentDay', // عرض اليوم
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.green[100], // لون خلفية
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'التاريخ الميلادي:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    _gregorianDate,
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Divider(thickness: 2),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[100], // لون خلفية
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'التاريخ الهجري:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    _hijriDate, // التاريخ الهجري باللغة العربية
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
