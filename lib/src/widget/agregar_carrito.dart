import 'package:flutter/material.dart';
import 'package:shose_app/src/widget/boton_naranja.dart';

class AgregarCarrito extends StatelessWidget {
  final double monto;
  const AgregarCarrito({Key? key, required this.monto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text(
              '\$$monto',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const BotonNaranja(texto: 'Add to Card'),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
