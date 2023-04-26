// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, library_private_types_in_public_api, sort_child_properties_last

import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController yearGroupController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bestFoodController = TextEditingController();
  final TextEditingController bestMovieController = TextEditingController();
  final TextEditingController majorController = TextEditingController();
  final TextEditingController residencyController = TextEditingController();

  bool isLoading = false;

  Future<void> createProfile() async {
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse(
        'https://us-central1-jacks-project-382700.cloudfunctions.net/salieufinal/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'student_id': studentIdController.text,
        'name': nameController.text,
        'email': emailController.text,
        'dob': dobController.text,
        'year_group': yearGroupController.text,
        'major': majorController.text,
        'residency': residencyController.text,
        'best_food': bestFoodController.text,
        'best_movie': bestMovieController.text,
      }),
    );
    if (response.statusCode == 201) {
      setState(() {
        isLoading = false;
      });
      final data = jsonDecode(response.body)['data'];

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('data', jsonEncode(data));

      Fluttertoast.showToast(
          msg: "Profile created successfully", webPosition: "left");
    } else {
      Fluttertoast.showToast(msg: "An error occured", webPosition: "left");
      // Handle error
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 138, 73, 68),
        title: const Text('Create Profile Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: studentIdController,
                        decoration: InputDecoration(
                          labelText: 'ID number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your student ID ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: dobController,
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: yearGroupController,
                        decoration: InputDecoration(
                          labelText: 'Year Group',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: majorController,
                        decoration: InputDecoration(
                          labelText: 'Major',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: residencyController,
                        decoration: InputDecoration(
                          labelText: 'Residency',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: bestFoodController,
                        decoration: InputDecoration(
                          labelText: 'Best Food',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: bestMovieController,
                        decoration: InputDecoration(
                          labelText: 'Best Movie',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(
                              width: 740,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: createProfile,
                                child: Text('Create Profile'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 138, 73, 68),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
