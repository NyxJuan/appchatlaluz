import 'package:applaluz_chat/routes/routes.dart';
import 'package:applaluz_chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat La Luz',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}
