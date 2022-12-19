import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black87,
      child: const Center(
        child: Text(
          'Before/After\'lar\nYağ Oranı Grafikleri\nSu içme Grafikleri\nUyku Grafikleri',
        ),
      ),
    );
  }
}
