import 'package:flutter/material.dart';
import 'package:mobile_travel/models/dataForTrip.dart';
import 'package:mobile_travel/screans/detalesOfCat_screan.dart';
import 'package:mobile_travel/widgets/secondBage_design.dart';

List<TripScrean> favorite = [];

class FavoriteScereen extends StatefulWidget {
  FavoriteScereen({super.key});

  @override
  State<FavoriteScereen> createState() => _favoritState();
}

class _favoritState extends State<FavoriteScereen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 320,
            child: PageView(reverse: true, children: [
              favorite[index],
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 310,
                    alignment: Alignment.center,
                    child: const Text(
                      "حذف هذا العنصر من المفضله",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          favorite.removeAt(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                "تم حذف العنصر من المفضله بنجاح",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              action: SnackBarAction(
                                  label: "تم",
                                  onPressed: () {
                                    setState(() {});
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  }),
                            ),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              ),
            ]),
          );
        },
        itemCount: favorite.length,
      ),
    );
  }
}
