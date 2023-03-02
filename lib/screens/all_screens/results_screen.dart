import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      backgroundColor: Colors.black87,
      child: Center(
        child: Text(
          "Before/After'lar\nYağ Oranı Grafikleri\nSu içme Grafikleri\nUyku Grafikleri",
        ),
      ),
    );
  }
}
