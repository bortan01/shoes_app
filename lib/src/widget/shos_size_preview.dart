import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shose_app/src/provider/zapato_provider.dart';

import '../pages/zapato_desc_page.dart';

class ShoseSizePreview1 extends StatelessWidget {
  const ShoseSizePreview1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ZapatoDescPage(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 0,
          ),
          child: Container(
            width: double.infinity,
            height: 410,
            decoration:
                BoxDecoration(color: const Color(0xffFFCF53), borderRadius: BorderRadius.circular(50)),
            child: const Column(
              children: [
                _ShoeWithShadow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShoseSizePreview2 extends StatelessWidget {
  const ShoseSizePreview2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 5,
      ),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: const BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topLeft: Radius.circular(40),
              topRight: Radius.circular(50)),
        ),
        child: const Column(
          children: [
            _ShoeWithShadow(),
            _ZapatoTalla(),
          ],
        ),
      ),
    );
  }
}

class _ZapatoTalla extends StatelessWidget {
  const _ZapatoTalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(numero: 4),
          _TallaZapatoCaja(numero: 5),
          _TallaZapatoCaja(numero: 6),
          _TallaZapatoCaja(numero: 7),
          _TallaZapatoCaja(numero: 8),
          _TallaZapatoCaja(numero: 9),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;
  const _TallaZapatoCaja({
    Key? key,
    required this.numero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ZapatoProvider>(context);
    const boxShadow2 = [BoxShadow(blurRadius: 10, offset: Offset(0, 8), color: Color(0xffF1a23a))];


    return GestureDetector(
      onTap: () => zapatoProvider.talla = numero,
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: zapatoProvider.talla == numero ? const Color(0xffF1a23a) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: zapatoProvider.talla == numero ? boxShadow2 : null,
        ),
        child: Text(
          numero.toString().replaceAll('.0', ''),
          // style: style,
          style: zapatoProvider.talla == numero
              ? Theme.of(context).textTheme.headlineLarge
              : Theme.of(context).textTheme.headlineMedium,
          // style: TextStyle(
          //   color: zapatoProvider.talla == numero ? Colors.white : const Color(0xfff1a23a),
          //   fontSize: 14,
          //   fontWeight: FontWeight.bold,
          // ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  const _ShoeWithShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ZapatoProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);

    // 390 horizontal
    return SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        children: [
          const _ZapatoSombra(),
          Container(
            height: screenHeight < 450 ? screenHeight * 0.8 : screenHeight * 0.4,
            padding: const EdgeInsets.all(30),
            child: Image(
              image: AssetImage(zapatoProvider.assetImage),
            ),
          ),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 55,
      right: 10,
      child: Transform.rotate(
        angle: -0.5,
        child: Container(
          width: 280,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xffEAA14E), blurRadius: 35),
            ],
          ),
        ),
      ),
    );
  }
}
