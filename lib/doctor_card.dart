import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled5/doctor_details.dart';
import 'package:untitled5/product_itm.dart';

final firestore =
    FirebaseFirestore.instance.collection('doctor details').snapshots();

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.route});

  final String route;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayheight = MediaQuery.of(context).size.height;
    return Container(
      height: displayheight * .75,
      child: GestureDetector(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: firestore,
                builder: (BuildContext value,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return CircularProgressIndicator();
                  if (snapshot.hasError) return Text(('Some error'));

                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data!.docs[index];
                          return ListTile(
                            title: ProductItem(
                                Degree: data['Degree'],
                                name: data['name'],
                                price: data['price'],
                                Experience: data['Experience'],
                                registraionnumber: data['registraionnumber'],
                                image: data['image']),
                            /*   trailing: IconButton(
                              icon: Icon(Icons.directions),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorDetails(
                                            productName: data['productName'],
                                            productPrice:
                                                data['productPrice'])));
                              },
                            ),*/
                          );
                          /* return Card(
                            child: ListTile(
                              horizontalTitleGap: 100,
                              title: Text(
                                "Dr." +
                                    snapshot.data!.docs[index]['name']
                                        .toString(),
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 30,
                                ),
                              ),
                              subtitle: Column(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child: Image.asset(
                                      'img/profile.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    'Email: ' + snapshot.data!.docs[index]['email']
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                ],
                              ),
                              trailing: Text(
                                  'Price:' +
                                      snapshot.data!.docs[index]['price']
                                          .toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              onTap: (){




                              },

                              ),

                            );*/
                        }),
                  );
                }),
          ],
        ),
        /*  child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Image.asset(
                  'img/profile.png',
                  fit: BoxFit.fill,
                ),
              ),


              const Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dr Nishant',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Dental',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          Text('4.5'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('Reviews'),
                          Text('(20)'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),*/

        onTap: () {
          ///      Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }
}
