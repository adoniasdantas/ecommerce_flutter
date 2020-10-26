import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceTile extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  PlaceTile(this.documentSnapshot);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100.0,
            child: Image.network(
              documentSnapshot.data()['image'],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  documentSnapshot.data()['title'],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                Text(
                  documentSnapshot.data()['address'],
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Ver no mapa'),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: () {
                  launch(
                      'https://www.google.com/maps/search/?api=1&query=${documentSnapshot.data()['lat']},${documentSnapshot.data()['long']}');
                },
              ),
              FlatButton(
                child: Text('Ligar'),
                textColor: Colors.blue,
                padding: EdgeInsets.zero,
                onPressed: () {
                  launch('tel:${documentSnapshot.data()['phone']}');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
