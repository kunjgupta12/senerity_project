import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:untitled5/user/user_data.dart';
import 'package:untitled5/widgets/appbar_widget.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditbloodtypeFormPage extends StatefulWidget {
  const EditbloodtypeFormPage({Key? key}) : super(key: key);

  @override
  EditbloodtypeFormPageState createState() {
    return EditbloodtypeFormPageState();
  }
}

class EditbloodtypeFormPageState extends State<EditbloodtypeFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstbloodtypeController = TextEditingController();
  final secondbloodtypeController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    firstbloodtypeController.dispose();
    super.dispose();
  }

  void updateUserValue(String bloodtype) {
    user.bloodtype = bloodtype;
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
                  width: 330,
                  child: const Text(
                    "What's Your Blood Type?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            // Handles Form Validation for First Name
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Blood Type';
                              } else if (!isAlpha(value)) {
                                return 'Only Letters Please';
                              }
                              return null;
                            },
                            decoration:
                                InputDecoration(labelText: 'Blood Type'),
                            controller: firstbloodtypeController,
                          ))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            // Handles Form Validation for Last Name
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Antigen Kind';
                              } else if (!isAlpha(value)) {
                                return 'Only Letters Please';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Antigen Kind'),
                            controller: secondbloodtypeController,
                          )))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 330,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate() &&
                                isAlpha(firstbloodtypeController.text +
                                    secondbloodtypeController.text)) {
                              updateUserValue(firstbloodtypeController.text +
                                  "  " +
                                  secondbloodtypeController.text);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )))
            ],
          ),
        ));
  }
}
