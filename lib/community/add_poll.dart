import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CreatePollPage extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  void _submitPoll(BuildContext context) {
    if (_formKey.currentState!.saveAndValidate()) {
      final pollData = _formKey.currentState?.value;
      final pollOptions = (pollData?['options'] as String)
          .split(',')
          .map((option) => option.trim())
          .toList();
      final pollQuestion = pollData?['question'];

      // Add the new poll to Firestore
      FirebaseFirestore.instance.collection('polls').add({
        'question': pollQuestion,
        'options': pollOptions,
        'created_at': FieldValue.serverTimestamp(),
      });

      Navigator.of(context).pop(); // Close the create poll page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a New Poll'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                name: 'question',
                decoration: InputDecoration(labelText: 'Poll Question'),
              //  validator: FormBuilderValidators.required(context),
              ),
              FormBuilderTextField(
                name: 'options',
                decoration: InputDecoration(labelText: 'Poll Options (comma-separated)'),
       //         validator: FormBuilderValidators.required(context),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _submitPoll(context),
                child: Text('Create Poll'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
