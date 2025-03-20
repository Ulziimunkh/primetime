import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:primetime/components/rounded_button.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/pages/Resource/Room/rooms_page.dart';

class OrgPriceTable extends StatefulWidget {
  const OrgPriceTable({super.key});

  @override
  State<OrgPriceTable> createState() => _OrgPriceTableState();
}

class _OrgPriceTableState extends State<OrgPriceTable> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> uploadedImages = []; // List to store uploaded images

  void _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Галерейгээс сонгох'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      uploadedImages.add(image);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Камер ашиглах'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    setState(() {
                      uploadedImages.add(image);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _removeImage(int index) {
    setState(() {
      uploadedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Үнийн мэдээлэл",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Үнийн мэдээлэл эсвэл меню зураг оруулах:",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text("Зураг нэмэх"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: uploadedImages.isEmpty
                  ? const Center(
                      child: Text(
                        "Одоогоор зураг оруулаагүй байна.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: uploadedImages.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.file(
                              File(uploadedImages[index].path),
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () => _removeImage(index),
                            ),
                          ],
                        );
                      },
                    ),
            ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RoundedButton(
                        text: "Дараагийн",
                        press: () {
                           Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const RoomsPage()),
                                  );
                          
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: RoundedButton(
                        text: "Буцах",
                        press: () => Navigator.pop(context),
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}