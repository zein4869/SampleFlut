import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatGPT-like UI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              // Top bar area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Row(
                  children: [
                  // menu
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: const Icon(Icons.menu, color: Colors.black87),
                  ),
                  const Spacer(),
                  // upgrade pill
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F5FF),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.diamond, size: 18, color: Color(0xFF5B3CF2)),
                        SizedBox(width: 8),
                        Text('Nâng cấp', style: TextStyle(color: Color(0xFF5B3CF2), fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // profile-ish round button
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Image.network(
                        'https://via.placeholder.com/150',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // main center content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Tôi có thể giúp gì cho bạn?',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 26),

                  // buttons grid
                  SizedBox(
                    width: size.width * 0.86,
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        _ActionPill(icon: Icons.image, label: 'Tạo hình ảnh', color: Colors.green),
                        _ActionPill(icon: Icons.lightbulb, label: 'Lên ý tưởng', color: Colors.amber),
                        _ActionPill(icon: Icons.bar_chart, label: 'Phân tích dữ liệu', color: Colors.lightBlue),
                        _ActionPill(icon: Icons.more_horiz, label: 'Thêm', color: Colors.grey),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // bottom input area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.add, size: 26),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F7F8),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Ask ChatGPT',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const Icon(Icons.mic_none),
                        const SizedBox(width: 8),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.graphic_eq, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  ),
);

} }

class _ActionPill extends StatelessWidget { final IconData icon; final String label; final Color color; const _ActionPill({required this.icon, required this.label, required this.color});

@override Widget build(BuildContext context) { return Material( color: Colors.white, borderRadius: BorderRadius.circular(28), child: InkWell( borderRadius: BorderRadius.circular(28), onTap: () {}, child: Container( padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), decoration: BoxDecoration( borderRadius: BorderRadius.circular(28), ), child: Row( mainAxisSize: MainAxisSize.min, children: [ Container( width: 28, height: 28, decoration: BoxDecoration( color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(8), ), child: Icon(icon, size: 16, color: color), ), const SizedBox(width: 10), Text(label, style: const TextStyle(fontWeight: FontWeight.w600)), ], ), ), ), ); } }

