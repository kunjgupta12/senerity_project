import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class verify extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<verify> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final TextEditingController _textController = TextEditingController();
  String? _imageURL;

  // Function to pick an image from the device
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      final imageFile = File(image.path);
      // Upload the selected image to Firebase Storage
      final ref = _storage.ref().child(
          'post_images/${_auth.currentUser?.uid}/${DateTime.now().toString()}.jpg');
      await ref.putFile(imageFile);
      // Get the image URL
      final imageURL = await ref.getDownloadURL();
      setState(() {
        _imageURL = imageURL;
      });
    }
  }

  // Function to create a new post
  Future<void> _createPost() async {
    final user = _auth.currentUser;
    if (user != null) {
      final String text = _textController.text;
      final String userId = user.uid;

      // Add the new post to Firestore
      await _firestore.collection('verified').doc(user.uid).update({
        'type': 'adhaar',
        // 'text': text,
        'verified': false,
        'image_url': _imageURL,
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
        title: Text('Get verify'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                if (_imageURL != null) Image.network(_imageURL!),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick Image'),
                ),
                ElevatedButton(onPressed: _createPost, child: Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
