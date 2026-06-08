import 'package:flutter/material.dart';
import '../../../../core/app_theme/AppColors.dart';
import '../../../../core/app_theme/app_images.dart';
import '../RobotTap/alerts/Alerts.dart';
import '../RobotTap/chatBot/ChatBot.dart';

class DroneContent extends StatelessWidget {
  const DroneContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Drone",
          style: TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: ImageIcon(AssetImage(AppImage.chatbot)),
            color: AppColor.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatBot()),
              );
            },
          ),
          IconButton(
            icon: ImageIcon(AssetImage(AppImage.alert)),
            color: AppColor.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Alerts()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── NDVI HeatMap ───────────────
              _sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "NDVI HeatMap",
                      style: TextStyle(
                        color: AppColor.green8,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        child: Image.asset(AppImage.NDVI, fit: BoxFit.cover),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: const LinearGradient(
                          colors: [Colors.red, Colors.yellow, Colors.green],
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Stressed",
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                        Text(
                          "Healthy",
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      "Health Status",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: _healthCard(
                            label: "Healthy Area",
                            value: "60%",
                            dot: Colors.green,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: _healthCard(
                            label: "Warning Area",
                            value: "10%",
                            dot: Colors.orange,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Expanded(
                          child: _healthCard(
                            label: "Stressed Area",
                            value: "30%",
                            dot: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // ─── Growth Rate ─────────────────────────────────────────
              _sectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Growth Rate",
                      style: TextStyle(color: AppColor.gray, fontSize: 16),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "10 cm/week",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Text(
                          "Last 4 Weeks  ",
                          style: TextStyle(color: AppColor.gray, fontSize: 14),
                        ),
                        Container(
                          child: const Text(
                            "+5%",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      height: 120,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          _BarChartItem(label: "Week 1", heightFactor: 0.45),
                          _BarChartItem(label: "Week 2", heightFactor: 0.60),
                          _BarChartItem(label: "Week 3", heightFactor: 0.75),
                          _BarChartItem(label: "Week 4", heightFactor: 1.00),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // ─── Expected Harvest ────────────────────────────────────
              _sectionCard(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Expected Harvest",
                            style: TextStyle(
                              color: AppColor.green8,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            "23 Days Remaining",
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: 1 - (23 / 60),
                            strokeWidth: 5,
                            backgroundColor: AppColor.gray4,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColor.green6,
                            ),
                          ),
                          const Icon(
                            Icons.eco_outlined,
                            color: AppColor.green6,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _sectionCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColor.greenD,
        borderRadius: BorderRadius.circular(18),
      ),
      child: child,
    );
  }

  static Widget _healthCard({
    required String label,
    required String value,
    required Color dot,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(color: AppColor.white, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.circle, color: dot, size: 8),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Bar Chart Item ────────────────────────────────────────────────
class _BarChartItem extends StatelessWidget {
  final String label;
  final double heightFactor;

  const _BarChartItem({required this.label, required this.heightFactor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 36,
          height: 80 * heightFactor,
          decoration: BoxDecoration(
            color: heightFactor == 1.0
                ? Colors.green
                : Colors.green.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        const SizedBox(height: 6),

        Text(label, style: const TextStyle(color: AppColor.gray, fontSize: 13)),
      ],
    );
  }
}
