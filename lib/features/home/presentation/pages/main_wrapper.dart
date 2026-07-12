// lib/features/home/presentation/pages/main_wrapper.dart

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Center(
      child: Text('Home Page / خانه', style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text('Search Page / جستجو', style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text(
        'Downloads / دانلودها',
        style: TextStyle(color: Colors.white),
      ),
    ),
    const Center(
      child: Text('Profile / پروفایل', style: TextStyle(color: Colors.white)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F14), // تم بسیار تاریک هماهنگ با عکس
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: GlassmorphicContainer(
          width: MediaQuery.of(context).size.width,
          height: 70,
          borderRadius: 30,
          blur: 20,
          alignment: Alignment.center,
          border: 1.5,
          linearGradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.1),
              Colors.white.withOpacity(0.05),
            ],
          ),
          borderGradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.white.withOpacity(0.05),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(
              0xFFFF4500,
            ), // نارنجی/قرمز نئون مشابه طرح
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.download_for_offline),
                label: 'Downloads',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
