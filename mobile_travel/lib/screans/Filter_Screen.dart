import 'package:flutter/material.dart';
import 'package:mobile_travel/widgets/drawer_item.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _triptype1State();
}

bool isinsummer = false;
bool isinwinter = false;
bool isforfamilies = false;

class _triptype1State extends State<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "التصفيه",
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "تم حفظ متطلباتك بنجاح",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      action: SnackBarAction(
                          label: "تم",
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          }),
                    ),
                  );
                });
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: const Drawer(
        child: myDrawer(),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text(
              "الرحلات الصيفيه",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            subtitle: const Text(
              "اظهار الرحلات الصيفيه فقط",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            onChanged: (value) {
              setState(() {
                isinsummer = value;
              });
            },
            value: isinsummer,
            activeColor: const Color.fromARGB(255, 201, 121, 17),
          ),
          SwitchListTile(
            title: const Text(
              "الرحلات الشتويه",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            subtitle: const Text(
              "اظهار الرحلات الشتويه فقط",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            onChanged: (value) {
              setState(() {
                isinwinter = value;
              });
            },
            value: isinwinter,
            activeColor: const Color.fromARGB(255, 201, 121, 17),
          ),
          SwitchListTile(
            title: const Text(
              "الرحلات العائليه",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            subtitle: const Text(
              "اظهار الرحلات العائليه فقط",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            onChanged: (value) {
              setState(() {
                isforfamilies = value;
              });
            },
            value: isforfamilies,
            activeColor: const Color.fromARGB(255, 201, 121, 17),
          )
        ],
      ),
    );
  }
}
