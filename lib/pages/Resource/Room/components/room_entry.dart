import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:primetime/components/squared_input_field.dart';
import 'package:primetime/constants/constants.dart';
import 'package:primetime/components/rounded_button.dart';
import 'dart:io';

class RoomEntry extends StatefulWidget {
  const RoomEntry({super.key});

  @override
  State<RoomEntry> createState() => _RoomEntryState();
}

class _RoomEntryState extends State<RoomEntry> {
  final TextEditingController roomNumberController = TextEditingController();
  final TextEditingController roomNameController = TextEditingController();
  final TextEditingController additionalInfoController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  bool isVip = false;
  List<XFile> imageFiles = []; // List to store selected images

  final ImagePicker _picker = ImagePicker();

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
                      imageFiles.add(image);
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
                      imageFiles.add(image);
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
      imageFiles.removeAt(index);
    });
  }

  void _saveRoom() {
    if (roomNumberController.text.isNotEmpty &&
        roomNameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        capacityController.text.isNotEmpty) {
      Navigator.pop(context, {
        'roomno': roomNumberController.text,
        'roomname': roomNameController.text,
        'vip': isVip ? 'Тийм' : 'Үгүй',
        'price': priceController.text,
        'capacity': capacityController.text,
        'additionalinfo': additionalInfoController.text,
        'photos': imageFiles.map((file) => file.path).join(', '),
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Бүх талбарыг бөглөнө үү')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Өрөө нэмэх",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SquaredInputField(
                labelText: "Өрөөний дугаар",
                hintText: "Өрөөний дугаар оруулна уу",
                icon: Icons.format_list_numbered,
                onChanged: (value) => roomNumberController.text = value,
              ),
              SizedBox(height: size.height * 0.02),
              SquaredInputField(
                labelText: "Өрөөний нэр",
                hintText: "Өрөөний нэр оруулна уу",
                icon: Icons.business_rounded,
                onChanged: (value) => roomNameController.text = value,
              ),
              const SizedBox(height: 16),
              SquaredInputField(
                labelText: "Цагийн үнэлгээ",
                icon: Icons.monetization_on_rounded,
                textInputType: TextInputType.number,
                hintText: "Цагийн үнэлгээ",
                onChanged: (value) => priceController.text = value,
              ),
              const SizedBox(height: 16),
              SquaredInputField(
                hintText: "Багтаамж",
                labelText: "Багтаамж",
                textInputType: TextInputType.number,
                icon: Icons.people_rounded,
                onChanged: (value) => capacityController.text = value,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    const Text("VIP эсэх: "),
                    Switch(
                      value: isVip,
                      onChanged: (value) {
                        setState(() {
                          isVip = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
               SquaredInputField(
                labelText: "Нэмэлт мэдээлэл",
                hintText: "Нэмэлт мэдээлэл оруулна уу",
                icon: Icons.info_rounded,
                onChanged: (value) => additionalInfoController.text = value,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Зурагнууд:"),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: imageFiles.map((file) {
                        int index = imageFiles.indexOf(file);
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.file(
                              File(file.path),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () => _removeImage(index),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text("Зураг нэмэх"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              RoundedButton(
                text: "Хадгалах",
                press: _saveRoom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}