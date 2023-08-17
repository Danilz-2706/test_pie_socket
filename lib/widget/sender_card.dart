import 'package:flutter/material.dart';

class SenderCard extends StatelessWidget {
  final String message;
  final String? date;
  const SenderCard({
    super.key,
    required this.message,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Colors.blue[200],
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 5,
          ),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
                bottom: 10,
              ),
              child: Text(
                message,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
