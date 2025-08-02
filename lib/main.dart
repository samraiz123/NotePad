import 'package:flutter/material.dart';
import 'package:go_green/provider/note_provider.dart';
import 'package:go_green/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final noteProvider = NoteProvider();
  await noteProvider.loadNotesFromPrefs();

  runApp(ChangeNotifierProvider.value(value: noteProvider, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NoteKeeper',
      themeMode: ThemeMode.dark,

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF673AB7),
        scaffoldBackgroundColor: Color(0xFF121212),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF673AB7),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF673AB7),
        ),
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF673AB7),
          secondary: Color(0xFFD1C4E9),
        ),
      ),

      home: SplashScreen(),
    );
  }
}
