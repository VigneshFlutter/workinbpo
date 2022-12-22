import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:nav2/provider/internet_provider.dart';
import 'package:nav2/provider/profile_provider.dart';
import 'package:nav2/splash_screen/splash_screen.dart';
import 'package:nav2/utils/constants.dart';
import 'package:provider/provider.dart';


const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel' ,
  'High Importance Notifications' ,
  description: 'This channel is used for important notifications.',
  importance: Importance.high ,
  playSound: true
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage msg) async {
  await Firebase.initializeApp();
  RemoteNotification? notification = msg.notification ;
  AndroidNotification? android = msg.notification?.android ;

  if(notification != null && android != null){
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id ,
                channel.name ,
                channelDescription: channel.description ,
                color: Colors.blue ,
                playSound: true  ,
                icon: "@mipmap/ic_launcher"
            )
        ));
  }
  print('A bg message just showed up ${msg.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51MBv8ISIA9ZLGrD0On5VZg6tukY82gz0nDcQsNVURNAICpWbXoLr0O5ia2fDwYYf3bPoJhrL0v9CiiPD9SDaC87E00tGyoVzhA';
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true ,
    badge: true ,
    sound: true
  );
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    notification();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification ;
      AndroidNotification? android = message.notification?.android ;

      if(notification != null && android != null){
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id ,
                channel.name ,
                channelDescription: channel.description ,
                color: Colors.blue ,
                playSound: true  ,
                icon: "@mipmap/ic_launcher"
              )
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) { 
      print('A new onMessageOpended event was published');
      RemoteNotification? notification = message.notification ;
      AndroidNotification? android = message.notification?.android ;

      if(notification != null && android != null){
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                    channel.id ,
                    channel.name ,
                    channelDescription: channel.description ,
                    color: Colors.blue ,
                    playSound: true  ,
                    icon: "@mipmap/ic_launcher"
                )
            ));
      }
    });
    notification();
    super.initState();
  }

  void notification() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print('The Login fcm token $fcmToken');
  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProvider()) ,
        ChangeNotifierProvider(create: (_)=> InternetProvider()) ,
      ],
      child: MaterialApp(
          title: APP_NAME,
          theme: ThemeData(
            primaryColor: const Color(0xff2F8D46),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen()
      ),);
  }
}



