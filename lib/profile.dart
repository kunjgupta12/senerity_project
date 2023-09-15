import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:untitled5/ForgotPasswordPage.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepagee extends StatefulWidget {
  const Homepagee({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepagee> {
  String location = 'Null, Press Button';
  String Address = 'search';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/Opening Page background.png"),
              fit: BoxFit.fill,
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Coordinates Points',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                location,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'ADDRESS',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('${Address}'),
              ElevatedButton(
                  onPressed: () async {
                    Position position = await _getGeoLocationPosition();
                    location =
                        'Lat: ${position.latitude} , Long: ${position.longitude}';
                    GetAddressFromLatLong(position);
                  },
                  child: Text('Get Location')),
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
                      width: 26,
                    ),
                    Text(
                      "Contact Us",
                      /*   style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black45),*/
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
