import 'package:flutter/material.dart';
import 'package:shose_app/src/widget/custom_widgets.dart';

import '../helpers/helpers.dart';

class ZapatoPage extends StatelessWidget {
  const ZapatoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusDartk();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfffafafa),
        title: const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'For You',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            Hero(
              tag: 'zapato-1',
              child: ShoseSizePreview(),
            ),
            ZapatoDescription(
              titulo: 'Nike Air Max 720',
              descripcion:
                  "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AgregarCarrito(monto: 180),
    );
  }
}
