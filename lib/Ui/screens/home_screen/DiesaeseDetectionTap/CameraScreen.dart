import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/ai/plant_disease_model.dart';
import '../../../../core/app_theme/AppColors.dart';
import 'DetailsScreen.dart';

class CameraScreen extends StatefulWidget {
  final File image;

  const CameraScreen({super.key, required this.image});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  PlantDiseaseModel model = PlantDiseaseModel();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    initAndAnalyze();
  }

  Future initAndAnalyze() async {
    await model.loadModel();

    await Future.delayed(const Duration(seconds: 1));

    var result = model.runModel(widget.image);

    print("RESULT: $result");

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => DetailsScreen(
          image: widget.image,
          result: result,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.file(widget.image, fit: BoxFit.cover),
          ),

          AnimatedBuilder(
            animation: controller,
            builder: (_, __) {
              return Positioned(
                top: controller.value *
                    MediaQuery.of(context).size.height,
                left: 0,
                right: 0,
                child: Container(
                  height: 3,
                  color: Colors.greenAccent,
                ),
              );
            },
          ),

          const Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Scanning Leaf...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}