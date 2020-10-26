import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/tiles/category_tile.dart';
import 'package:flutter/material.dart';

class ProductTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('products').get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var dividedTiles = ListTile.divideTiles(
                    tiles: snapshot.data.docs.map((doc) {
                      return CategoryTile(doc);
                    }),
                    color: Colors.grey.shade800)
                .toList();

            return ListView(
              children: dividedTiles,
            );
          }
        });
  }
}
