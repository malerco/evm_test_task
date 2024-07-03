import 'package:evm_test_task/ui/screens/main_screen/main_screen.dart';
import 'package:evm_test_task/ui/screens/main_screen/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Malerco TestTask',
      theme: ThemeData(

        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(create: (context) => MainScreenViewModel(), child: MainScreen()),
    );
  }
}

