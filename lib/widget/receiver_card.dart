import 'package:flutter/material.dart';
import 'package:test_pie_socket/page/contains.dart';

class ReceiverCard extends StatelessWidget {
  final String message;
  final String date;
  final bool onlyOnePerson;

  const ReceiverCard({
    Key? key,
    required this.message,
    required this.date,
    required this.onlyOnePerson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 32,
          width: 32,
          child: onlyOnePerson
              ? const SizedBox()
              : Image.asset(
                  "assets/Oval.png",
                  height: 32,
                  width: 32,
                  fit: BoxFit.contain,
                ),
        ),
        const SizedBox(width: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 160),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: kWhiteColors,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 16,
                  color: kTextBlackColors,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          date,
          style: const TextStyle(
              color: kTextGreyColors,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
