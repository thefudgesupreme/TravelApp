import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
