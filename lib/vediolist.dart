import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class slogin extends StatefulWidget {
  const slogin({super.key, required this.id});
  final id;

  @override
  State<slogin> createState() => _sloginState();
}

class _sloginState extends State<slogin> {
  DocumentSnapshot? user;
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(user!['url'].toString()))
          ..initialize().then((_) {
            setState(() {});
          });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(child: VideoPlayer(_controller)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
