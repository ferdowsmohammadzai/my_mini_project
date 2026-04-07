import 'package:flutter/material.dart';
// برای وب به این کتابخانه نیاز داریم
import 'dart:html' as html;

void main() {
  runApp(const MyWebApp());
}

class MyWebApp extends StatelessWidget {
  const MyWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal, // تم رنگی تیل
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // تابع دانلود فایل
  void downloadData() {
    const String content = "سلام! این فایل از برنامه فلاتر شما دانلود شد.";
    final bytes = Uri.encodeComponent(content);
    html.AnchorElement(href: "data:text/plain;charset=utf-8,$bytes")
      ..setAttribute("download", "info.txt")
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ۱. اپ‌بار (AppBar)
      appBar: AppBar(
        title: const Text('برنامه من'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      
      // ۲. منوی کشویی (Drawer)
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('منو', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('صفحه اصلی'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      body: Center(
        child: ElevatedButton.icon(
          onPressed: downloadData,
          icon: const Icon(Icons.download),
          label: const Text('دانلود این برنامه در لپ‌تاپ'),
        ),
      ),

      // ۳. فلوتینگ اکشن بتن (FAB)
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
