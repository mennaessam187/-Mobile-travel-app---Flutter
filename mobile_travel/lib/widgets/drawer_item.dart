import 'package:flutter/material.dart';
import 'package:mobile_travel/screans/categories_screan.dart';
import 'package:mobile_travel/screans/Filter_Screen.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({super.key});

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: const Color.fromARGB(255, 255, 174, 34),
          alignment: Alignment.center,
          child: Text(
            "دليلك السياحي",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() {});
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (contex) => categoryScreen()));
            },
            child: const Row(
              children: [
                Icon(
                  Icons.card_travel,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "الرحلات",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )
              ],
            )),
        TextButton(
            onPressed: () {
              setState(() {});
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (contex) => FilterScreen()));
            },
            child: const Row(
              children: [
                Icon(
                  Icons.filter_list,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "التصفيه",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )
              ],
            ))
      ],
    );
  }
}
