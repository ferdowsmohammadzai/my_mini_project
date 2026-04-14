import 'package:flutter/material.dart';
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
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      appBar: AppBar(
        title: const Text('برنامه من'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              accountName: Text("Ferdows Mohammadzai"),
              accountEmail: Text("ferdowsmohammarzai@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.teal),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('صفحه اصلی'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      // بدنه اصلی برنامه
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ۱. دکمه دانلود در ابتدای صفحه
          ElevatedButton.icon(
            onPressed: downloadData,
            icon: const Icon(Icons.download),
            label: const Text('دانلود برنامه'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
          
          const SizedBox(height: 30), // فاصله بین دکمه و کارت‌ها

          // ۲. کارت شماره ۱: ساده و مدرن
          Container(
            height: 120,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Center(
              child: ListTile(
                leading: Icon(Icons.credit_card, color: Colors.teal, size: 40),
                title: Text("یادآوری یاداشت های شما در اینجا", style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(" روشن ساختن هشدار برای یاآوری"),
              ),
            ),
          ),

          // ۳. کارت شماره ۲: گرادینت
          Container(
            height: 120,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.teal, Colors.tealAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.teal.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                "ثبت یاداشت جدید شما",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // ۴. کارت شماره ۳: حاشیه‌دار
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.teal, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("نمایش یاداشت ها", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("یاداشت های ثبت شده"),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
