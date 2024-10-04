import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'topbar.dart';

void main() {
  runApp(const MaterialApp(
    home: Home()
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Container(
        color: const Color(0xFFcfefcf),
        child: const ImagePickerWidget(),
      ),
    );
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> birds = [
    'Yellow-billed Babbler',
    'Large-billed Crow',
    'Common Myna',
    'Black Drongo',
    'House Sparrow',
    'Indian Peafowl',
    'Indian Roller',
    'Indian Pitta',
    'Indian Paradise Flycatcher'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: birds.map((bird) => Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
        child: Text(bird)
      )).toList(),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _image == null
              ? const Text('No image selected.')
              : Image.file(_image!,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover),
          const SizedBox(height: 20),
          _image == null ?
          ElevatedButton(
            onPressed: _selectImage,
            child: const Text('Select Image from Gallery'),
          ) : const SizedBox.shrink(),
          _image == null ? const SizedBox.shrink() : ElevatedButton(
              onPressed: () {},
              child: const Text('Identify Bird')
          )

        ],
      )
    );
  }
}
