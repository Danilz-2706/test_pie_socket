import 'package:flutter/material.dart';
import 'package:test_pie_socket/page/contains.dart';
import 'package:test_pie_socket/widget/app_bar_review.dart';

class ReviewSceen extends StatelessWidget {
  const ReviewSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarReview(
                title: "Review bao gia Garage",
                avatar: "assets/Group.svg",
                press: () {},
              ),
              const WhyChooseIt(),
              Container(),
              const ItemReviewDetail()
            ],
          ),
        ),
      ),
    );
  }
}

class WhyChooseIt extends StatelessWidget {
  const WhyChooseIt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kSpacing,
        vertical: kSpacing,
      ),
      decoration: const BoxDecoration(
        color: kWhiteColors,
        borderRadius: BorderRadius.all(
          Radius.circular(kSpacing),
        ),
      ),
      child: const Column(
        children: [
          Text(
            "Tai sao lai la Car Doctor?",
            style: TextStyle(
              color: kTextBlackColors,
            ),
          ),
          SizedBox(height: kSpacing),
          Text(
            ". Loren ipscum dolor sit amet consectetur.",
            style: TextStyle(
              color: kTextGreyColors,
            ),
          ),
          Text(
            ". Loren ipscum dolor sit amet consectetur.",
            style: TextStyle(
              color: kTextGreyColors,
            ),
          ),
          Text(
            ". Loren ipscum dolor sit amet consectetur.",
            style: TextStyle(
              color: kTextGreyColors,
            ),
          ),
          Text(
            ". Loren ipscum dolor sit amet consectetur.",
            style: TextStyle(
              color: kTextGreyColors,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemReviewDetail extends StatelessWidget {
  const ItemReviewDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kWhiteColors,
        borderRadius: BorderRadius.all(
          Radius.circular(
            kSpacing,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/Oval.png',
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Nguyen Van A",
                    style: TextStyle(
                      color: kBlackColors,
                    ),
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ],
          ),
          const Text(
            "Tieu de: Loi khuyen tu chuyen gia Car Doctor",
            style: TextStyle(color: kTextBlackColors),
          ),
          const Text(
            "Tieu de: Loi khuyen tu chuyen gia Car Doctor",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: kTextGreyColors),
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: kWhiteColors,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      kSpacing,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
