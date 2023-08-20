import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:test_pie_socket/page/contains.dart';
import 'package:test_pie_socket/widget/app_bar_review.dart';

class ReviewSceen extends StatefulWidget {
  const ReviewSceen({super.key});

  @override
  State<ReviewSceen> createState() => _ReviewSceenState();
}

class _ReviewSceenState extends State<ReviewSceen> {
  late CameraController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarReview(
                title: "Chup anh",
                avatar: "assets/Group.svg",
                press: () {},
              ),
              Text(
                "CHUP ANH BAO GIA GARAGE",
                style: TextStyle(color: kTextBlackColors),
              ),
              Text(
                "Vui long tai len hinh anh day du thong tin cua anh bao gia garage",
                style: TextStyle(
                  color: kTextBlackColors,
                ),
              ),
              Container(
                height: 400,
                width: 300,
                child: FutureBuilder(
                  future: initializationCamera(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(controller);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        kSpacing,
                      ),
                    ),
                    color: kWhiteColors,
                    border: Border.all(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  child: Text("Chup lai"),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          kSpacing,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.takePicture().then((value) {
                        if (value != null) {}
                      });
                    },
                    child: SizedBox(),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
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
        ),
      ),
    );
  }

  Future<void> initializationCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(
      cameras[EnumCameraDescription.back.index],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await controller.initialize();
  }
}

enum EnumCameraDescription { front, back }
