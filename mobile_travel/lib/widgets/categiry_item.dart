import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_travel/screans/category_trips.dart';
import '../screans/category_trips.dart';

class SelectSpeceficCat extends StatelessWidget {
  late String title;
  late String imageUrl;
  late String id;
  SelectSpeceficCat(
      {required this.title, required this.imageUrl, required this.id});
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed("second", arguments: {
      "id": id,
      "title": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: NetworkImage(imageUrl),
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
