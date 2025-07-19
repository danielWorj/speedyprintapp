import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speedy/color/color.dart';

class EditImage extends StatefulWidget {
  const EditImage({super.key});

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Editor",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: primary,
        actions: [
          image == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageEditor(
                                    image: XFile(image!.path),
                                  )));
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Center(
                  child: image == null
                      ? const Text(
                          "Aucune image selectionnée",
                          style: TextStyle(fontSize: 18),
                        )
                      : Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                        ))),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: pickImage,
            icon: Icon(Icons.image),
            label: const Text(
              "Select Image from Gallery",
              style: TextStyle(color: white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: secondary),
          )
        ],
      ),
    );
  }

  Future<void> pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pickedImage;
    });
  }
}
