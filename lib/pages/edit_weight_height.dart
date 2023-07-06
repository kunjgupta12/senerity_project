import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:untitled5/user/user_data.dart';
import 'package:untitled5/widgets/appbar_widget.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditweightandheightFormPage extends StatefulWidget {
  const EditweightandheightFormPage({Key? key}) : super(key: key);

  @override
  EditweightandheightFormPageState createState() {
    return EditweightandheightFormPageState();
  }
}

class EditweightandheightFormPageState extends State<EditweightandheightFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstweightController = TextEditingController();
  final secondheightController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    firstweightController.dispose();
    super.dispose();
  }

  void updateUserValue(String weightandheight) {
    user.weightandheight = weightandheight;
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
                    "What's Your Weight AND Height ?",
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
                                return 'Please enter your Weight';
                              } else if (!isNumeric(value)) {
                                return 'Only Numbers Pls';
                              }
                              return null;
                            },
                            decoration:
                                InputDecoration(labelText: ' Weight'),
                            controller: firstweightController,
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
                                return 'Please enter your Height';
                              } else if (!isNumeric(value)) {
                                return 'Only Numbers Pls';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Height'),
                            controller: secondheightController,
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
                                isNumeric(firstweightController.text +
                                    secondheightController.text)) {
                              updateUserValue(firstweightController.text + " kg "
                                  " -- " +
                                  secondheightController.text + " Cm ");
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
