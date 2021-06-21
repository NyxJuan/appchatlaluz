import 'package:applaluz_chat/screens/chat_screen.dart';
import 'package:applaluz_chat/screens/loading_screen.dart';
import 'package:applaluz_chat/screens/login_screen.dart';
import 'package:applaluz_chat/screens/register_screen.dart';
import 'package:applaluz_chat/screens/user_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'user': (_) => UserScreen(),
  'chat': (_) => ChatScreen(),
  'login': (_) => LoginScreen(),
  'register': (_) => RegisterScreen(),
  'loading': (_) => LoadingScreen(),
};
