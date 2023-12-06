import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class NewPostWrite extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostWrite> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final TextEditingController _textController = TextEditingController();
  String? _imageURL;

  // Function to create a new post
  Future<void> _createPost() async {
    final user = _auth.currentUser;
    if (user != null) {
      final String text = _textController.text;
      final String userId = user.uid;

      // Add the new post to Firestore
      await _firestore.collection('polls').add({
        'type': 'post',
        'text': text,
        'user_id': userId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Navigate back to the post list or any other screen
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Enter your post text'),
              ),
              ElevatedButton(
                onPressed: _createPost,
                child: Text('Create Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
