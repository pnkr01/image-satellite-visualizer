import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_satellite_visualizer/models/image_data.dart';
import 'package:image_satellite_visualizer/screens/dashboard.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ImageDataAdapter());
  // var box = await Hive.openBox<ImageData>('imageBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Satellite Visualizer',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[700],
        accentColor: Colors.tealAccent[700],
      ),
      home: Dashboard(title: 'Image Satellite Visualizer'),
    );
  }
}
