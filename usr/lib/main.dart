import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نظام مراقبة الجودة الذكي',
      debugShowCheckedModeBanner: false,
      // إعدادات اللغة العربية
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // اللغة العربية
      ],
      locale: const Locale('ar', 'AE'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32), // لون أخضر زراعي
          secondary: const Color(0xFF1565C0), // لون أزرق تقني
          surface: const Color(0xFFF5F5F5),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme), // استخدام خط Cairo المناسب للعربية
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          titleTextStyle: GoogleFonts.cairo(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const MainLayout(),
    );
  }
}
