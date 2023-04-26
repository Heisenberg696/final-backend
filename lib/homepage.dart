// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:socialnetwork/profile_page.dart';
import 'package:socialnetwork/view_profile.dart';
import 'create_post.dart';
import 'edit_profile.dart';
import 'feedpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 138, 73, 68),
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text("Home Page"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostPage()),
                );
              },
              child: Container(
                width: 230,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(height: 10),
                    Text("New Post", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              child: Container(
                width: 230,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit, color: Colors.white),
                    SizedBox(height: 10),
                    Text("Edit Profile", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Feed()),
                );
              },
              child: Container(
                width: 230,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.rss_feed, color: Colors.white),
                    SizedBox(height: 10),
                    Text("Feed", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewProfilePage()),
                );
              },
              child: Container(
                width: 230,
                height: 90,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 125, 36, 4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove_red_eye, color: Colors.white),
                    SizedBox(height: 10),
                    Text("View Profile", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Container(
                width: 230,
                height: 90,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 158, 15, 129),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified_user_sharp, color: Colors.white),
                    SizedBox(height: 10),
                    Text("Create Profile",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            // add more buttons here
          ],
        ),
      ),
    );
  }
}
