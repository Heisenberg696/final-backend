import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socialnetwork/feedpage.dart';

import 'Home.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 700,
            child: Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: DummyPage(),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Feed(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
