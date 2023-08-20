import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarReview extends StatelessWidget {
  final String title;
  final bool isList;
  final String avatar;
  final VoidCallback press;
  const AppBarReview({
    super.key,
    required this.title,
    this.isList = true,
    required this.avatar,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: press,
          icon: SvgPicture.asset("assets/arrow-left.svg"),
        ),
        if (!isList)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 32,
                width: 32,
                child: Image.asset(
                  avatar,
                  height: 28,
                  width: 28,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        if (isList)
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        SizedBox(
          height: 42,
          width: 42,
          child: isList
              ? SvgPicture.asset(
                  avatar,
                  height: 34,
                  width: 34,
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
