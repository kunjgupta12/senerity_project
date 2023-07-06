import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:untitled5/user/user_data.dart';
import 'package:untitled5/widgets/appbar_widget.dart';

// This class handles the Page to edit the Phone Section of the User Profile.
class EditbirthdateFormPage extends StatefulWidget {
  const EditbirthdateFormPage({Key? key}) : super(key: key);
  @override
  EditbirthdateFormPageState createState() {
    return EditbirthdateFormPageState();
  }
}

class EditbirthdateFormPageState extends State<EditbirthdateFormPage> {
  final _formKey = GlobalKey<FormState>();
  final birthdateController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    birthdateController.dispose();
    super.dispose();
  }

  void updateUserValue(String birthdate) {
    String formattedbirthdate = "" +
        birthdate.substring(0, 2) +
        "/ " +
      
        birthdate.substring(2, 4) +
        "/ " +
        birthdate.substring(4, 8) +
        "" +
        birthdate.substring(8, birthdate.length);
    user.birthdate = formattedbirthdate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: 320,
                    child: const Text(
                      "What's Your Birth Date?",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your birth date';
                            } else if (!isNumeric(value)) {
                              return 'Only Birth Date Please';
                            } else if (value.length < 7) {
                              return 'Please enter a VALID birth date';
                            }
                            return null;
                          },
                          controller: birthdateController,
                          decoration: const InputDecoration(
                            labelText: 'Your Birth Date',
                          ),
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate() &&
                                  isNumeric(birthdateController.text)) {
                                updateUserValue(birthdateController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}

