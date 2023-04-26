import 'package:flutter/material.dart';
import 'package:socialnetwork/profile_page.dart';
import 'package:socialnetwork/view_profile.dart';
import 'create_post.dart';
import 'edit_profile.dart';
import 'feedpage.dart';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 138, 73, 68),
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text("Home Page"),
      ),
      body: Row(
        children: [
          Container(
            width: 200,
            color: Colors.grey[200],
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Create Profile'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.add),
                        title: Text('New Post'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PostPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.edit),
                        title: Text('Edit Profile'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.rss_feed),
                        title: Text('Feed'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Feed()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.remove_red_eye),
                        title: Text("View Profile"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewProfilePage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.account_circle),
                      onPressed: () {
                        // TODO: Add code to navigate to user account page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewProfilePage()));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: () {
                        // TODO: Add code to logout.
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
