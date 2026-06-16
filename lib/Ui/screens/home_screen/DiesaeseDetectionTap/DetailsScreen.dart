import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/app_theme/AppColors.dart';

class DetailsScreen extends StatelessWidget {
  final File image;
  final List result;

  const DetailsScreen({
    super.key,
    required this.image,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    List diseases = [
      "Healthy",
      "Powdery Mildew",
      "Leaf Rust"
    ];

    List<double> output =
    List<double>.from(result.map((e) => (e as num).toDouble()));

    double maxValue = output.reduce((a, b) => a > b ? a : b);

    int index = output.indexOf(maxValue);

    String diseaseName =
    (index >= 0 && index < diseases.length) ? diseases[index] : "Unknown";

    double confidence = maxValue * 100;

    return Scaffold(
      backgroundColor: AppColor.background,
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              child: Image.file(image, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.greenD,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Text(
                  "Disease: $diseaseName",
                  style: const TextStyle(
                    color: AppColor.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Confidence: ${confidence.toStringAsFixed(2)} %",
                  style: const TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}