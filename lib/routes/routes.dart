import 'package:applaluz_chat/routes/screens/chat_screen.dart';
import 'package:applaluz_chat/routes/screens/loading_screen.dart';
import 'package:applaluz_chat/routes/screens/login_screen.dart';
import 'package:applaluz_chat/routes/screens/register_screen.dart';
import 'package:applaluz_chat/routes/screens/user_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'user': (_) => UserScreen(),
  'chat': (_) => ChatScreen(),
  'login': (_) => LoginScreen(),
  'register': (_) => RegisterScreen(),
  'loading': (_) => LoadingScreen(),
};
