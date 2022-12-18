import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shose_app/src/pages/zapato_page.dart';
import 'package:shose_app/src/provider/zapato_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ZapatoProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: ZapatoPage(),
      ),
    );
  }
}
