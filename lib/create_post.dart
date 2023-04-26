// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, sized_box_for_whitespace, sort_child_properties_last, duplicate_import

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> _createPost() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.post(
        Uri.parse(
            'https://us-central1-jacks-project-382700.cloudfunctions.net/salieufinal/create-post'),
        body: jsonEncode({
          'email': emailController.text,
          'description': descriptionController.text
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
            msg: "Post created successfully", webPosition: "left");
      } else {
        Fluttertoast.showToast(msg: "An error occured", webPosition: "left");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "$e", webPosition: "left");
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
        title: const Text('Create Post'),
        backgroundColor: const Color.fromARGB(255, 138, 73, 68),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please enter your description';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        width: 620,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _createPost,
                          child: Text('Create Post'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 138, 73, 68),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
