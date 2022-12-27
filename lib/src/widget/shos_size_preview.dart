import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shose_app/src/pages/zapato_desc_page.dart';
import 'package:shose_app/src/provider/zapato_provider.dart';

class ShoseSizePreview extends StatelessWidget {
  final bool fullScreen;
  const ShoseSizePreview({Key? key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ZapatoDescPage(),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen ? 5 : 30,
          vertical: fullScreen ? 0 : 5,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: fullScreen
                ? BorderRadius.circular(50)
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(50)),
          ),
          child: Column(
            children: [
              const _ShoeWithShadow(),
              Visibility(
                visible: !fullScreen,
                child: const _ZapatoTalla(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTalla extends StatelessWidget {
  const _ZapatoTalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaZapatoCaja(numero: 7),
          _TallaZapatoCaja(numero: 7.5),
          _TallaZapatoCaja(numero: 8),
          _TallaZapatoCaja(numero: 8.5),
          _TallaZapatoCaja(numero: 9),
          _TallaZapatoCaja(numero: 9.5),
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
          style: TextStyle(
            color: zapatoProvider.talla == numero ? Colors.white : const Color(0xfff1a23a),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
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

    return Stack(
      children: [
        const _ZapatoSombra(),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Image(
            image: AssetImage(zapatoProvider.assetImage),
          ),
        ),
      ],
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
