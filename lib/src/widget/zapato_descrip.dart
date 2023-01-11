import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ZapatoDescription extends StatelessWidget {
  final String titulo;
  final String descripcion;
  const ZapatoDescription({
    Key? key,
    required this.titulo,
    required this.descripcion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          FadeInDown(
            child: Text(
              descripcion,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.black54,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
