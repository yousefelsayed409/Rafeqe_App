import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:app_settings/app_settings.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:quranapp/core/helper/cash_helper.dart';


class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      AppSettings.openAppSettings();
      print('User declined or has not accepted permission');
    }
  }
 Future<String?> getToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      if (token != null) {
        CashNetwork.insertTocash(key: 'Token', value: token);
        print('Device Token: $token');
        return token;
      }
    } catch (e) {
      print('Error getting token: $e');
    }
    return null;
  }
  Future<String?> getAccessToken() async {
  final serviceAccountJson = {
     "type": "service_account",
  "project_id": "rafeqe-app",
  "private_key_id": "1e8879b9b81fd545868f82107fcb42b23bbc8b70",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDoq2wmHOSlymlo\nnmfK1l+WUrRhr6RB0WwUSQheOvKbgnhd7Z8abk/kua032abtvwoGng51pVcpoFDK\nDm5SH6Hb+B5sy9vRITzZYhKcCIQHm1u9NkkBr9ia5tzqq7yj+jDh7RmKWTlOZl9K\nREEJHTjzauR4vEuCsnXdT5MDflgvGZmUS0Pm3AtK6oPRG9uM2H2U+7TR8hZL10C6\nRnNn+iwMS4WdSWAIPnLMotDwdOwBJauApzOxScQeifwMpc9QJ8t/BrR7FMD1TFeO\nPRbnrmj4MeGGLav9so84pxeq11U5BCdDfdf9y5u2haliSmqM+dpwQepXjsz+gF+9\nq80ReEI9AgMBAAECggEAYthAr8hiktR1B48URSXhofkszLtTquqPYebM+UtNuicp\nf63tg8sNgfwnzKxYsHQSjFElj3FYoESNTennkFgD6XF1a38HucbHFQsHIOa1QI4N\n4UpopaDRAq3FeKTRFVC656BU02OoZtgy71gj0P1rLm5g9bH42mN6kzS1HizUxdzo\n9byu/FAVmUlFI45RSfdD935FPNPz9eSctM6NsaB/I+lc0a4IVwlciC2kUj1RwTwN\n+4tOic52lRpSW5+sVYakp+ojtn4T1tGDkdvSAAUD9YxTqI11WzZmuSQ5PCCGKw02\n2p52BlQL1bYfuJkJAquOxMIivSkUuUOmbxN9CevXeQKBgQD01ACO9IrXs3eOiVG9\nLbysH1vYO8jXRerxD9lIfiYYoRlsynXdV1Nn8ckZ9haeZb+W3ScZVRnCNOWQdySl\n+3TWx+1OntUSE0XXoNCtdyoDUdN7bI6NTo9Ts/qVuM+TyPGkeF/kSRqQj6Sxyhch\nVTMwZN1dWx+UoOlMgR8j/UdqDwKBgQDzSWOB8X+LOSh+xWBVpc+mStksypjTibvQ\nB5goWwhGy5ICgexMonLHdi9QLo+fsU1ovMrftK/Y+05mMkZMDryJAL3lLu4H4Tji\nIg9OpcOHQrtdbjinjQcBVpAOPE7BM97t5TMYDfjMPmGDzsX7hmd8RSoKPknyHVV2\n2H40jNYK8wKBgF/Gx+kk1WQIu06xfZ6KU/Lp2Z4/1RQSMBTZ5GCtqO2dqDqdAXrz\nfJd/SPK1CKgymb7FCVSprAgDdYMMePPN6SlU0Qseq7AEhiASs1AI/BCMZDU2hJXX\nE87k67TCtcHUrGNxC+Jcjt3as80xh9bsY7gc3VR2H2afhGT/ZlVH8jYVAoGAArW8\nkAP6obhfRRo5unqAV5/Zz2/qR+Du4KBVB44MB43Y8II1+ZyNnr8oQ8JhAyxcamA/\n+kHu+4HBG85PjiVT4ErL0rO1Hw1ZLtumRAAAr48Eu0OxCdy+STuHm0D8t5Y2U3wM\nF6aAMPY469jvx591o6K5lyeedz3wZ8R9k2RGNhUCgYEArgYr1Pjkyvpfu3fGtOOB\nTconrbN+m+J4oS5EOZYOh5fNZ7OYeBe/YzevfZKWba60W4fdocXa9rH5w0jUaZq7\nIBY4ZRJYvE7dJ+qGBsXMtIifjoZ9Vs/crsuIBBKE1Vr+yBwTp7KInaih+49g7EnX\nGrwDgzbx7ja9cs/KO+JtRDM=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-u6ykb@rafeqe-app.iam.gserviceaccount.com",
  "client_id": "117025547448633954891",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-u6ykb%40rafeqe-app.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
  };

  List<String> scopes = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/firebase.database",
    "https://www.googleapis.com/auth/firebase.messaging"
  ];

  try {
    var client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client);

    client.close();

    if (credentials.accessToken.expiry.isBefore(DateTime.now())) {
      print("Access token is expired. Fetching a new token...");
      // Fetch new access token
      credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client,
      );
    }

    // Return the access token
    String accessToken = credentials.accessToken.data;
    print("Access token retrieved: $accessToken");

    // Store the token in cache if necessary
    CashNetwork.insertTocash(key: 'AccessToken', value: accessToken);

    return accessToken;
  } catch (e) {
    print("Error obtaining access token: $e");
    return null;
  }
}
  Future<void> sendNotifications({
    required String fcmToken,
    // required String title,
    required String body,
    //  String? topicname,
    
    String? type,
  }) async {
    try {
      var serverKeyAuthorization = await getAccessToken();
      
      const String urlEndPoint =
          "https://fcm.googleapis.com/v1/projects/rafeqe-app/messages:send";

      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      var response = await dio.post(
        urlEndPoint,
        data: getBody(
          // topic:topicname ,
          // userId: userId,
          fcmToken: fcmToken,
          // title: title,
          body: body,
          type: type ?? "message",
          
        ),
      );

      // Print response status code and body for debugging
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');
    } catch (e) {
      print("Error sending notification: $e");
    }
  }    

  Map<String, dynamic> getBody({
    required String fcmToken,
    // required String title,
    required String body,
    //  String? topic,
    String? type,
  }) {
    return {
      "message": {
        // "topic":topic,
        "token": fcmToken,
        "notification": {
          // "title": title,
           "body": body},
        "android": {
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default"
          }
        },
        "apns": {
          "payload": {
            "aps": {"content_available": true}
          }
        },
        "data": {
          "type": type,
          // "id": userId,
          "click_action": "FLUTTER_NOTIFICATION_CLICK"
        }
      }
    };
  }
  
  void refreshToken() async {
    _firebaseMessaging.onTokenRefresh.listen((String newToken) {
      print('New token: $newToken');
    });
  }

  void setupFirebaseMessaging(BuildContext context) async {
    await FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (kDebugMode) {
        print('Received a message while in the foreground!');
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data);
        print(message.data['id']);
      }

      if (Platform.isAndroid) {
        initializeLocalNotifications(context);
        showLocalNotification(message);
      } else {
        showLocalNotification(message);
      }
    });
  }

  Future<void> initializeLocalNotifications(BuildContext context) async {
  var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var iosInitializationSettings = const DarwinInitializationSettings();

  var initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
    iOS: iosInitializationSettings,
  );

  await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          Map<String, dynamic> payload = json.decode(response.payload!);
          RemoteMessage message = RemoteMessage(
            data: payload,
          );
          handelMessage(context, message);
        }
      });
}


  void handelMessage(BuildContext context, RemoteMessage message) {
    if (message.data['id'] == '12345') {
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return MessageTest(id: message.data['id']);
      // },),);
    }
  }

  Future<void> setupIntrectMessage(BuildContext context) async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      handelMessage(context, initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handelMessage(context, event);
    });
  }

  Future<void> showLocalNotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
      'High Importance Notification',
      importance: Importance.max,
    );

    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );

    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification?.title ?? ""
        ////???!!!!1
        // 'No Title'
        ,
        message.notification?.body ?? 'No Body',
        notificationDetails,
        payload: message.data['data'],
      );
    });
  }

  Future<void> subscribeToTopic(String topic) async {
    try {
      await _firebaseMessaging.subscribeToTopic(topic);
      print('Subscribed to topic: $topic');
    } catch (e) {
      print('Error subscribing to topic: $e');
    }
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      await _firebaseMessaging.unsubscribeFromTopic(topic);
      print('Unsubscribed from topic: $topic');
    } catch (e) {
      print('Error unsubscribing from topic: $e');
    }
  }

  Future<void> setupNotificationChannels() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'your_channel_id',
      'Your Channel Name',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

}

