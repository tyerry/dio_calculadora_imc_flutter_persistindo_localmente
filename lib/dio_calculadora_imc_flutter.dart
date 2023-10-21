import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/access_page.dart';

class DioCalculadoraIMCFlutter extends StatefulWidget {
  const DioCalculadoraIMCFlutter({super.key});

  @override
  State<DioCalculadoraIMCFlutter> createState() =>
      _DioCalculadoraIMCFlutterState();
}

class _DioCalculadoraIMCFlutterState extends State<DioCalculadoraIMCFlutter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.arvoTextTheme(),
        colorScheme: const ColorScheme(
          primary: Color(0xFF6B1DC3),
          outlineVariant: Color(0xFF191B4D),
          secondary: Color(0xFF66ED6C),
          surfaceVariant: Color(0xFFFDFDFC),
          surface: Color(0xFF8C6147),
          background: Color(0xFF1B1C35),
          error: Colors.redAccent,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: const AccessPage(),
    );
  }
}
