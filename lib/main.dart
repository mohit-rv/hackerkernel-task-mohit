import 'package:flutter/material.dart';
import 'package:hackerkernel_task_mohit_verma/View/Home/home.dart';
import 'package:hackerkernel_task_mohit_verma/View/Splash/splash_screen.dart';
import 'package:hackerkernel_task_mohit_verma/View/addproduct/addproduct.dart';
import 'package:hackerkernel_task_mohit_verma/View/login/login.dart';
import 'package:hackerkernel_task_mohit_verma/ViewModel/home_viewmodel.dart';
import 'package:hackerkernel_task_mohit_verma/ViewModel/login_viewmodel.dart';
import 'package:provider/provider.dart';

Size mq = const Size(100, 100);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewmodel()),
        ChangeNotifierProvider(create: (_) => HomeViewmodel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/addproduct': (context) => const AddProductInList(),
        },
      ),
    );
  }
}
