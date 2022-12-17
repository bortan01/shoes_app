import 'package:flutter/material.dart';

import 'src/pages/zapato_desc_page.dart';
import 'src/pages/zapato_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: ZapatoDescPage(),
    );
  }
}
