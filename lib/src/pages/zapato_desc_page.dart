import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:shose_app/src/widget/custom_widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ShoseSizePreview(fullScreen: true),
            ZapatoDescription(
              titulo: 'Nike Air Max 720',
              descripcion:
                  "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
            ),
            _MontoBuyNow(),
            _ColorsAndMore(),
            _BotonesLikeCartSettings(),
          ],
        ),
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Transform.rotate(
            angle: math.pi,
            child: Row(
              children: const [
                _BotonColor(color: Color(0xffc6d642)),
                _BotonColor(color: Color(0xffffAD29)),
                _BotonColor(color: Color(0xff3664d6)),
                _BotonColor(color: Color(0xff2099f1)),
              ],
            ),
          ),
          const Spacer(),
          const BotonNaranja(texto: 'texto')
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;

  const _BotonColor({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 0.8,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: const [
          Text(
            '\$180',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          BotonNaranja(
            texto: 'Buy Now',
            ancho: 120,
            alto: 40,
          )
        ],
      ),
    );
  }
}
