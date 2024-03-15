import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ApplyDialog extends StatefulWidget {
  const ApplyDialog({Key? key}) : super(key: key);

  @override
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<ApplyDialog> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _fatherController = TextEditingController();
  TextEditingController _motherController = TextEditingController();
  TextEditingController _nationalityController = TextEditingController();
  TextEditingController _contactPersonController = TextEditingController();
  TextEditingController _contactDetailsController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  String? _selectedGender;
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
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
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for the exam card', style: TextStyle(fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth / 2.4,
                    child: TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(hintText: 'First name'),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 2.4,
                    child: TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(hintText: 'Last name'),
                    ),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                    width: screenWidth / 2.4,
                    child: TextField(
                      controller: _nationalityController,
                      decoration: InputDecoration(hintText: 'Nationality'),
                    )),
                SizedBox(
                    width: screenWidth / 2.4,
                    child: TextField(
                      controller: _cityController,
                      decoration: InputDecoration(hintText: 'City'),
                    )),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                    width: screenWidth / 2.4,
                    child: TextField(
                      controller: _fatherController,
                      decoration: InputDecoration(hintText: 'Father'),
                    )),
                SizedBox(
                    width: screenWidth / 2.4,
                    child: TextField(
                      controller: _motherController,
                      decoration: InputDecoration(hintText: 'Mother'),
                    )),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                    width: screenWidth / 2.4,
                    child: TextField(
                      controller: _contactPersonController,
                      decoration: InputDecoration(hintText: 'Contact person'),
                    )),
                SizedBox(
                    width: screenWidth / 2.4,
                    child: TextField(
                      controller: _contactDetailsController,
                      decoration: InputDecoration(hintText: 'Phone or email'),
                    )),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth / 2.4,
                    child: DropdownButtonFormField<String>(
                      value: _selectedGender,
                      hint: Text('Gender'),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                      items: ['Male', 'Female']
                          .map((gender) => DropdownMenuItem<String>(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                    ),
                  ),
                  _image == null
                      ? TextButton(
                          onPressed: getImage,
                          child: Text('Upload Image'),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Image.file(
                            _image!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                ],
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(hintText: 'Description'),
                maxLines: null,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
