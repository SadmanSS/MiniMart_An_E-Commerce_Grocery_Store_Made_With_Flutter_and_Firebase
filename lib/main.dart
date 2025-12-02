import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minimart/providers/cart_provider.dart';
import 'package:minimart/providers/auth_provider.dart';
import 'package:minimart/providers/orders_provider.dart';
import 'package:minimart/providers/products_provider.dart';
import 'package:minimart/widgets/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:minimart/firebase/firebase_options.dart';
import 'package:minimart/theme/app_theme.dart';

import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Request storage permissions
  await [Permission.storage, Permission.manageExternalStorage].request();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MiniMart',
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
