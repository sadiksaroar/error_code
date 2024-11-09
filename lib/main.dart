import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D Animal Viewer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimalViewerScreen(),
    );
  }
}

class AnimalViewerScreen extends StatefulWidget {
  @override
  _AnimalViewerScreenState createState() => _AnimalViewerScreenState();
}

class _AnimalViewerScreenState extends State<AnimalViewerScreen> {
  String currentModel = 'assets/models/lion.glb';

  // Map of buttons and their respective models
  final Map<String, String> animalModels = {
    'Lion': 'assets/DamagedHelmet.glb',
    'Elephant': 'assets/velocirra_vortex_muscle_car.glb',
    // 'Tiger': 'assets/models/tiger.glb',
  };

  void updateModel(String modelPath) {
    setState(() {
      currentModel = modelPath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Animal Viewer'),
      ),
      body: Column(
        children: [
          // 3D Model Viewer
          Expanded(
            child: ModelViewer(
              src: currentModel,
              alt: "A 3D model of an animal",
              ar: true,
              autoRotate: true,
              cameraControls: true,
            ),
          ),

          // Buttons to switch between models
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: animalModels.keys.map((animal) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ElevatedButton(
                    onPressed: () => updateModel(animalModels[animal]!),
                    child: Text(animal),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
