import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:untitled5/user/user_data.dart';
import 'package:untitled5/widgets/appbar_widget.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditcityandcountryFormPage extends StatefulWidget {
  const EditcityandcountryFormPage({Key? key}) : super(key: key);

  @override
  EditcityandcountryFormPageState createState() {
    return EditcityandcountryFormPageState();
  }
}

class EditcityandcountryFormPageState extends State<EditcityandcountryFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstcityController = TextEditingController();
  final secondcountryController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    firstcityController.dispose();
    super.dispose();
  }

  void updateUserValue(String cityandcountry) {
    user.cityandcountry = cityandcountry;
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
                    "What's Your City AND Country?",
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
                                return 'Please enter your City';
                              } else if (!isAlpha(value)) {
                                return 'Only Letters Please';
                              }
                              return null;
                            },
                            decoration:
                                InputDecoration(labelText: 'City'),
                            controller: firstcityController,
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
                                return 'Please enter your Country';
                              } else if (!isAlpha(value)) {
                                return 'Only Letters Please';
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(labelText: 'Country'),
                            controller: secondcountryController,
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
                                isAlpha(firstcityController.text +
                                    secondcountryController.text)) {
                              updateUserValue(firstcityController.text +
                                  " - " +
                                  secondcountryController.text);
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
