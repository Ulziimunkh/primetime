import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:primetime/common/widgets/squared_input_field.dart';
import 'package:primetime/common/constants/constants.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? profilePhotoPath;

  Future<void> _pickProfilePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profilePhotoPath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text("Хэрэглэгчийн мэдээлэл",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: kPrimaryColor),),
      backgroundColor: Colors.white,),
       resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickProfilePhoto,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: profilePhotoPath != null
                        ? FileImage(File(profilePhotoPath!))
                        : const AssetImage('assets/images/default_profile.png') as ImageProvider,
                    child: profilePhotoPath == null
                        ? const Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
            SquaredInputField(
                        labelText: "Хэрэглэгчийн нэр", 
                        hintText: "Нэрээ оруулна уу", 
                        icon: Icons.business_rounded, 
                        controller: nameController,
                        onChanged: (value){}
                        ),
              const SizedBox(height: 16),
                SquaredInputField(
                          labelText: "Утас 1",
                          hintText: "Утасны дугаар оруулна уу",
                          helperText: "Утасны дугаар оруулна уу",
                          textInputType: TextInputType.phone,
                          icon: Icons.phone_iphone_rounded,
                          controller: phoneController,
                          maxLength: 8,
                          onChanged: (value) {},
                        ),
              const SizedBox(height: 16),
    
              SquaredInputField(
                      labelText: "Имейл", 
                      hintText: "И-мейл оруулна уу", 
                      icon: Icons.email_rounded,
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      onChanged: (value){}
                      ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Save user details
                    final String name = nameController.text;
                    final String phone = phoneController.text;
                    final String email = emailController.text;

                    if (name.isEmpty || phone.isEmpty || email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Бүх талбарыг бөглөнө үү.")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Мэдээлэл амжилттай хадгалагдлаа.")),
                      );
                    }
                  },
                  child: const Text("Хадгалах"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}