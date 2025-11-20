import 'package:flutter/material.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سلسلة التوريد (Blockchain)'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'أدخل رقم الشحنة أو امسح QR Code',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.qr_code_scanner),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'مسار المنتج: طماطم عضوية - دفعة #8921',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildTimelineItem(
                  title: 'الحصاد',
                  description: 'تم الحصاد في مزرعة الوفرة',
                  date: '2023-10-25 08:30 AM',
                  isCompleted: true,
                  icon: Icons.agriculture,
                ),
                _buildTimelineItem(
                  title: 'فحص الجودة الأولي',
                  description: 'اجتاز الفحص بنسبة 98% (AI Verified)',
                  date: '2023-10-25 10:15 AM',
                  isCompleted: true,
                  icon: Icons.verified,
                ),
                _buildTimelineItem(
                  title: 'التغليف',
                  description: 'مركز التغليف الذكي - المنطقة الصناعية',
                  date: '2023-10-26 02:00 PM',
                  isCompleted: true,
                  icon: Icons.inventory_2,
                ),
                _buildTimelineItem(
                  title: 'النقل والتوزيع',
                  description: 'جاري النقل إلى المخازن المركزية',
                  date: '2023-10-27 09:00 AM',
                  isCompleted: true,
                  icon: Icons.local_shipping,
                ),
                _buildTimelineItem(
                  title: 'الوصول للمتجر',
                  description: 'متوقع الوصول: هايبر ماركت المدينة',
                  date: '---',
                  isCompleted: false,
                  icon: Icons.storefront,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String description,
    required String date,
    required bool isCompleted,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isCompleted ? Colors.green : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            Container(
              width: 2,
              height: 60,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isCompleted ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(color: Colors.grey.shade700),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
