import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shose_app/src/pages/zapato_page.dart';
import 'package:shose_app/src/provider/zapato_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ZapatoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const ZapatoPage(),
        theme: theme.copyWith(
          textTheme: theme.textTheme.copyWith(
            headlineLarge: const TextStyle(
              color: Color(0xfff1a23a),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
              headlineMedium: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
