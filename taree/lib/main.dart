import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taree/features/home/screens/home_screen.dart';
import 'package:taree/proxy_screen.dart';
import 'package:taree/router.dart';
import 'package:taree/theme/pallete.dart';

import 'core/common/error_text.dart';
import 'core/common/loader.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'dashboard.dart';
import 'features/health/screens/health_card_screen.dart';
import 'features/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    try {
      // FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
      // FirebaseFunctions.instance.useFunctionsEmulator("localhost", 5001);
      // await FirebaseStorage.instance.useStorageEmulator("localhost", 9199);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taree',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
        appBarTheme: AppBarTheme(
          color: Pallete.darkObjColor,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Login(),
      // ref.watch(userDataAuthProvider).when(
      //       data: (user) {
      //         ref.read(userModelProvider.notifier).update((state) => user);
      //         if (user != null) {
      //           return const ProxyScreen();
      //         }
      //         return const LoginScreen();
      //       },
      //       error: (err, trace) {
      //         return ErrorText(
      //           error: err.toString(),
      //         );
      //       },
      //       loading: () => const Loader(),
      //     ),
    );
  }
}
