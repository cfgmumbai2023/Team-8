import 'package:flutter/material.dart';
import 'package:taree/dashboard.dart';
import 'package:taree/features/health/screens/health_card_screen.dart';
import 'core/common/error_text.dart';
import 'features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case LoginScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const LoginScreen(),
    //   );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) =>  DashBoard(),
      );
    // case ProxyScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const ProxyScreen(),
    //   );
    case HealthCardScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => HealthCardScreen(),
      );
    // case ProductDetailScreen.routeName:
    //   var product = settings.arguments as ProductModel;
    //   return MaterialPageRoute(
    //     builder: (_) => ProductDetailScreen(
    //       product: product,
    //     ),
    //   );
    // case SearchScreen.routeName:
    //   var searchQuery = settings.arguments as String;
    //   return MaterialPageRoute(
    //     builder: (_) => SearchScreen(
    //       searchQuery: searchQuery,
    //     ),
    //   );

    // case UserInformationScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const UserInformationScreen(),
    //   );
    // case SelectContactsScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const SelectContactsScreen(),
    //   );
    // case MobileChatScreen.routeName:
    //   final arguments = settings.arguments as Map<String, dynamic>;
    //   final name = arguments['name'];
    //   final uid = arguments['uid'];
    //   final isGroupChat = arguments['isGroupChat'];
    //   final profilePic = arguments['profilePic'];
    //   return MaterialPageRoute(
    //     builder: (context) => MobileChatScreen(
    //       name: name,
    //       uid: uid,
    //       isGroupChat: isGroupChat,
    //       profilePic: profilePic,
    //     ),
    //   );
    // case ConfirmStatusScreen.routeName:
    //   final file = settings.arguments as File;
    //   return MaterialPageRoute(
    //     builder: (context) => ConfirmStatusScreen(
    //       file: file,
    //     ),
    //   );
    // case StatusScreen.routeName:
    //   final status = settings.arguments as Status;
    //   return MaterialPageRoute(
    //     builder: (context) => StatusScreen(
    //       status: status,
    //     ),
    //   );
    // case CreateGroupScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (context) => const CreateGroupScreen(),
    //   );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorText(error: 'This page doesn\'t exist'),
        ),
      );
  }
}
