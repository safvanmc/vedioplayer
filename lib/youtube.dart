import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AddVideoScreen extends StatefulWidget {
  @override
  _AddVideoScreenState createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  TextEditingController videoUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Video'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: videoUrlController,
              decoration: InputDecoration(labelText: 'YouTube Video URL'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('videos')
                    .add({'url': videoUrlController.text.trim()});
                Navigator.of(context).pop();
              },
              child: Text('Add Video'),
            ),
          ],
        ),
      ),
    );
  }
}
