import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التنبيهات والإشعارات'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAlertCard(
            title: 'تحذير: انخفاض الرطوبة',
            message: 'انخفضت نسبة الرطوبة في المخزن رقم 3 عن الحد المسموح به (40%). يرجى التحقق من أجهزة الترطيب.',
            time: 'منذ 10 دقائق',
            severity: AlertSeverity.high,
          ),
          _buildAlertCard(
            title: 'تنبيه صيانة',
            message: 'جهاز الاستشعار #IoT-502 يحتاج إلى معايرة دورية.',
            time: 'منذ ساعتين',
            severity: AlertSeverity.medium,
          ),
          _buildAlertCard(
            title: 'تقرير يومي جاهز',
            message: 'تم إنشاء تقرير الجودة اليومي للمنتجات الواردة.',
            time: 'منذ 5 ساعات',
            severity: AlertSeverity.low,
          ),
        ],
      ),
    );
  }

  Widget _buildAlertCard({
    required String title,
    required String message,
    required String time,
    required AlertSeverity severity,
  }) {
    Color color;
    IconData icon;

    switch (severity) {
      case AlertSeverity.high:
        color = Colors.red;
        icon = Icons.warning;
        break;
      case AlertSeverity.medium:
        color = Colors.orange;
        icon = Icons.info;
        break;
      case AlertSeverity.low:
        color = Colors.blue;
        icon = Icons.notifications;
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withOpacity(0.3)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(message),
            const SizedBox(height: 8),
            Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}

enum AlertSeverity { high, medium, low }
