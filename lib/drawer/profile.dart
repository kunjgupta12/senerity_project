import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:untitled5/auth/ForgotPasswordPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled5/bottom_nav/nav_bar.dart';

class Homepagee extends StatefulWidget {
  const Homepagee({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepagee> {
  String location = 'Searching';
  String Address = 'Finding';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  Future<void> get() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    GetAddressFromLatLong(position);
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    late User user;
    late String currentUId;
    late String currentEmail;
    late String number;
    user = auth.currentUser!;
    currentUId = user.uid.toString();
    currentEmail = user.email.toString();
    number = user.phoneNumber.toString();

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profilepage()));
              },
            );
          },
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'JosefinSans', fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/Opening Page background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              //for circle avtar image
              _getHeader(),
              SizedBox(
                height: 10,
              ),
              _profileName(user.uid),
              SizedBox(
                height: 14,
              ),
              _heading("Personal Details"),
              SizedBox(
                height: 6,
              ),
              _detailsCard(),
              SizedBox(
                height: 10,
              ),
              _heading("Support"),
              SizedBox(
                height: 6,
              ),
              _settingsCard(),
              Spacer(),
            ],
          )),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"))
                // color: Colors.orange[100],
                ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          'UId: ' + name,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _detailsCard() {
    final FirebaseAuth auth = FirebaseAuth.instance;

    late User user;
    late String currentUId;
    late String currentEmail;
    late String number;
    user = auth.currentUser!;
    currentUId = user.uid.toString();
    currentEmail = user.email.toString();
    number = user.phoneNumber.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.email),
              title: Text(currentEmail.toString()),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                number.toString(),
              ),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),

            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(
                location,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),

            ListTile(
              title: Text(
                '${Address}',
                textAlign: TextAlign.center,
              ),
              leading: Icon(Icons.home),
              trailing: IconButton(
                  onPressed: () {
                    get();
                  },
                  icon: Icon(Icons.refresh)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            MaterialButton(
              onPressed: () async {
                final url = Uri.parse(
                  'https://www.instagram.com/kunj__g/',
                );
                if (await canLaunchUrl(url)) {
                  launchUrl(url, mode: LaunchMode.inAppWebView);
                } else {
                  // ignore: avoid_print
                  print("Can't open  $url");
                }
              },
              child: Row(
                children: [
                  Image(
                      image: AssetImage("img/img_2.png"),
                      height: 30,
                      fit: BoxFit.fitWidth),
                  SizedBox(
                    width: 26,
                  ),
                  Text(
                    "Insta Handle",
                    /* style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45),*/
                  ),
                ],
              ),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            MaterialButton(
              onPressed: () async {
                final url = Uri.parse(
                  'tel:+91 9411310301',
                );
                if (await canLaunchUrl(url)) {
                  launchUrl(url, mode: LaunchMode.platformDefault);
                } else {
                  // ignore: avoid_print
                  print("Can't open  $url");
                }
              },
              child: Row(
                children: [
                  Icon(Icons.call),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Contact Us",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
            ListTile(
              leading: Icon(
                Icons.lock_reset,
              ),
              title: const Text('Reset Password'),
              onTap: () {
                //    navigateSecondPage(ForgotPasswordPage());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  /* child:
         Column(

            children: [
SizedBox(height: 20,),
              Text(

                " Unique User Id: " +
                    user.uid +
                    '\n' +
                    " Email Id: " +
                    currentEmail +
                    '\n' +
                    " Mobile Number:" +
                    number,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45),
              ),

            ],
          ),*/
}
