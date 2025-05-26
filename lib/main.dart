import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_services_module/core/route/route_config.dart';
import 'package:music_services_module/core/utils/theme/theme.dart';
import 'package:music_services_module/firebase_options.dart';
import 'package:music_services_module/view_model/service_view_model.dart';
import 'package:provider/provider.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(create: (_) => di.locator<ServiceViewModel>()..fetchServices(),
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Music Services Module',
      theme: appTheme,
    );
  }
}
