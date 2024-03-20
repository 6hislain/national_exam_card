import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:national_exam_card/utils/provider.dart';

import '../schemas/school.dart';
import '../schemas/combination.dart';
import '../schemas/user.dart';
import '../utils/api_service.dart';

class ApplyDialog extends ConsumerStatefulWidget {
  const ApplyDialog({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _ApplyState();
}

class _ApplyState extends ConsumerState<ApplyDialog> {
  File? _image;
  String? _selectedGender;
  String? _selectedSchool;
  String? _selectedCombination;
  User _user = User();
  List<School> _schools = [];
  List<Combination> _combinations = [];
  APIService apiService = APIService();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _fatherController = TextEditingController();
  TextEditingController _motherController = TextEditingController();
  TextEditingController _nationalityController = TextEditingController();
  TextEditingController _contactPersonController = TextEditingController();
  TextEditingController _contactDetailsController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

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
  void initState() {
    super.initState();
    _user = ref.read(userStateProvider);
    _schools = ref.read(schoolStateProvider);
    _combinations = ref.read(combinationStateProvider);
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
                      items: ['male', 'female']
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth / 2.4,
                    child: DropdownButtonFormField<String>(
                      value: _selectedSchool,
                      hint: Text('School'),
                      onChanged: (value) {
                        setState(() {
                          _selectedSchool = value;
                        });
                      },
                      items: _schools
                          .map((item) => DropdownMenuItem<String>(
                                value: '${item.id}',
                                child: Text(item.name ?? ""),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth / 2.4,
                    child: DropdownButtonFormField<String>(
                      value: _selectedCombination,
                      hint: Text('Combination'),
                      onChanged: (value) {
                        setState(() {
                          _selectedCombination = value;
                        });
                      },
                      items: _combinations
                          .map((item) => DropdownMenuItem<String>(
                                value: '${item.id}',
                                child: Text(item.name ?? ""),
                              ))
                          .toList(),
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
              ElevatedButton(
                onPressed: () async {
                  String city = _cityController.text.trim();
                  String father = _fatherController.text.trim();
                  String mother = _motherController.text.trim();
                  String lastName = _lastNameController.text.trim();
                  String firstName = _firstNameController.text.trim();
                  String description = _descriptionController.text.trim();
                  String nationality = _nationalityController.text.trim();
                  String contactPerson = _contactPersonController.text.trim();
                  String contactDetails = _contactDetailsController.text.trim();

                  if (city.isEmpty ||
                      mother.isEmpty ||
                      father.isEmpty ||
                      lastName.isEmpty ||
                      firstName.isEmpty ||
                      nationality.isEmpty ||
                      description.isEmpty ||
                      contactPerson.isEmpty ||
                      contactDetails.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Warning'),
                          content: Text('Fill in all the required fields.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }

                  Map<String, dynamic> data = {
                    'first_name': firstName,
                    'last_name': lastName,
                    'city': city,
                    'mother': mother,
                    'father': father,
                    'nationality': nationality,
                    'contact_person': contactPerson,
                    'contact_details': contactDetails,
                    'description': description,
                    'gender': _selectedGender,
                    'combination_id': _selectedCombination,
                    'school_id': _selectedSchool,
                    'status': 'pending',
                    'dob': '2024-03-13 10:25:19',
                    'id': _user.id,
                  };

                  print(data);

                  var response = await apiService.postData(
                      path: 'application', data: data);

                  print(response.statusCode);
                  print(response.headers);
                  print(response.body);

                  Navigator.of(context).pop();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
