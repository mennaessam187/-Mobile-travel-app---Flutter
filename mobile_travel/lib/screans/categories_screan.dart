import 'package:flutter/material.dart';
import 'package:mobile_travel/app_data.dart';
import 'package:mobile_travel/models/category.dart';
import 'package:mobile_travel/screans/favorite_screen.dart';
import 'package:mobile_travel/screans/Filter_Screen.dart';
import 'package:mobile_travel/widgets/categiry_item.dart';
import 'package:mobile_travel/widgets/drawer_item.dart';

class categoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<categoryScreen> {
  int currentindex = 0;
  List<Widget> l1 = [
    categoryScreen(),
    FavoriteScereen(),
  ];
  gettheAppBarTitle() {
    if (currentindex == 0) {
      return "التصنيفات";
    } else
      return "المفضله";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          gettheAppBarTitle(),
          style: const TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const Drawer(
        child: myDrawer(),
      ),
      body: currentindex == 0
          ? GridView(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 7 / 8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: Categories_data.map((categiryData) => SelectSpeceficCat(
                  title: categiryData.title,
                  imageUrl: categiryData.imageUrl,
                  id: categiryData.id)).toList(),
            )
          : FavoriteScereen(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        currentIndex: currentindex,
        selectedItemColor: const Color.fromARGB(255, 176, 123, 53),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_sharp), label: "التصنيفات"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "المفضله")
        ],
      ),
    );
  }
}
