import 'package:flutter/material.dart';
import '../../../../../core/app_theme/AppColors.dart';
import 'AlertsItem.dart';

class Alerts extends StatelessWidget {
  const Alerts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.green8,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Alerts",
          style: TextStyle(
            color: AppColor.green8,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dashboard Summary",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _summaryCard(
                      title: "Unread Alerts",
                      value: "12",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _summaryCard(
                      title: "Critical Alerts",
                      value: "3",
                      valueColor: AppColor.red,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              _summaryCard(
                title: "Resolved Alerts",
                value: "25",
                fullWidth: true,
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Alerts",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.rec,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.filter_list,
                          color: AppColor.green5,
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Filter",
                          style: TextStyle(
                            color: AppColor.green5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Expanded(
                child: ListView(
                  children: const [
                    AlertItem(
                      title: "Low Soil Moisture",
                      subtitle: "Irrigation needed in Zone 3",
                      time: "2h ago",
                      icon: Icons.water_drop_outlined,
                      iconColor: Colors.blue,
                    ),
                    AlertItem(
                      title: "Pest Alert",
                      subtitle: "Outbreak detected in Sector 1",
                      time: "4h ago",
                      icon: Icons.bug_report_outlined,
                      iconColor: Colors.red,
                    ),
                    AlertItem(
                      title: "Equipment Malfunction",
                      subtitle: "Greenhouse A pump offline",
                      time: "10h ago",
                      icon: Icons.build_outlined,
                      iconColor: Colors.orange,
                    ),
                    AlertItem(
                      title: "Critical Sensor Reading",
                      subtitle: "Ammonia levels high in Field 2",
                      time: "18h ago",
                      icon: Icons.warning_amber_rounded,
                      iconColor: Colors.amber,
                    ),
                    AlertItem(
                      title: "Disease Detected",
                      subtitle: "Blight identified in Crop B",
                      time: "1 day ago",
                      icon: Icons.coronavirus_outlined,
                      iconColor: Colors.purple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _summaryCard({
    required String title,
    required String value,
    Color valueColor = AppColor.white,
    bool fullWidth = false,
  }) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: AppColor.greenD,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColor.green8,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}