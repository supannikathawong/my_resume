import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.notoSansThaiTextTheme(),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 182, 232, 250),
      appBar: AppBar(
        title: const Text('Resume'),
        backgroundColor: const Color.fromARGB(255, 112, 196, 238),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // รูปโปรไฟล์แบบวงกลม
            CircleAvatar(
              radius: 60,
              backgroundImage: const AssetImage('assets/ch01.jpg'),
              onBackgroundImageError: (error, stackTrace) =>
                  const Text('โหลดรูปไม่ได้'),
            ),
            const SizedBox(height: 16.0),

            // ชื่อภาษาอังกฤษ
            Text(
              'Supannika Thawong',
              style: GoogleFonts.playfairDisplay(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade900,
              ),
            ),
            const SizedBox(height: 20),

            // ข้อมูลส่วนตัว
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    sectionTitle(Icons.person, 'ข้อมูลส่วนตัว'),
                    const SizedBox(height: 10),
                    buildInfoRow('ชื่อ - นามสกุล:', 'สุพรรณิกา ทาวงศ์'),
                    buildInfoRow('ภูมิลำเนา:', 'จังหวัดกำแพงเพชร'),
                    buildInfoRow('งานอดิเรก:', 'อ่านนิยาย, ดูซีรี่ย์,ฟังเพลง'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ประวัติการศึกษา
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    sectionTitle(Icons.school, 'ประวัติการศึกษา'),
                    const SizedBox(height: 10),
                    buildInfoRow(
                      'ประถมศึกษา:',
                      'โรงเรียนนารีราษฎร์สามัคคี (2559)',
                    ),
                    buildInfoRow('มัธยมต้น:', 'โรงเรียนวัชรวิทยา (2562)'),
                    buildInfoRow('มัธยมปลาย:', 'โรงเรียนวัชรวิทยา (2565)'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // แสดงหัวข้อพร้อมไอคอน
  Widget sectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueAccent),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.prompt(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }

  // แสดงแถวข้อมูล
  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
