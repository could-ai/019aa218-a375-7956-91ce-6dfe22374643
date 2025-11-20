import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مراقبة الجودة الحية (IoT)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderSection(),
            const SizedBox(height: 20),
            const Text(
              'قراءات المستشعرات الحالية',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.1,
              children: [
                _buildSensorCard(
                  title: 'درجة الحرارة',
                  value: '24°C',
                  icon: Icons.thermostat,
                  color: Colors.orange,
                  percent: 0.7,
                  status: 'مثالي',
                ),
                _buildSensorCard(
                  title: 'الرطوبة',
                  value: '65%',
                  icon: Icons.water_drop,
                  color: Colors.blue,
                  percent: 0.65,
                  status: 'جيد',
                ),
                _buildSensorCard(
                  title: 'جودة التربة',
                  value: 'PH 6.5',
                  icon: Icons.grass,
                  color: Colors.green,
                  percent: 0.8,
                  status: 'ممتاز',
                ),
                _buildSensorCard(
                  title: 'مستوى CO2',
                  value: '400 ppm',
                  icon: Icons.cloud,
                  color: Colors.grey,
                  percent: 0.4,
                  status: 'طبيعي',
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildAIInsightCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.green, size: 30),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('الموقع: مزرعة الوفرة - قطاع أ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('آخر تحديث: منذ 5 دقائق', style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSensorCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required double percent,
    required String status,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color),
                Text(status, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 10),
            CircularPercentIndicator(
              radius: 30.0,
              lineWidth: 5.0,
              percent: percent,
              center: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              progressColor: color,
              backgroundColor: color.withOpacity(0.2),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  Widget _buildAIInsightCard() {
    return Card(
      color: Colors.indigo.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.auto_awesome, color: Colors.indigo),
                SizedBox(width: 8),
                Text('تحليل الذكاء الاصطناعي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'بناءً على البيانات الحالية، من المتوقع ارتفاع درجة الحرارة خلال 3 ساعات. يوصى بتفعيل نظام الري الذكي لتجنب الإجهاد الحراري للمحصول.',
              style: TextStyle(fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.check),
              label: const Text('تفعيل الإجراء التصحيحي'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
