import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_travel/models/dataForTrip.dart';
import 'package:mobile_travel/screans/favorite_screen.dart';
import 'package:mobile_travel/widgets/secondBage_design.dart';

class DetalesofCategoriesScreen extends StatefulWidget {
  String? title;
  List<String>? activities;
  List<String>? program;
  String? imageUrl;
  String? id;
  int? duration;
  bool? isInSummer;
  bool? isInWinter;
  bool? isForFamilies;
  Season? season;
  TripType? tripType;
  DetalesofCategoriesScreen({
    required this.title,
    required this.activities,
    required this.program,
    required this.imageUrl,
    required this.id,
    required this.duration,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
    required this.season,
    required this.tripType,
  });

  @override
  State<DetalesofCategoriesScreen> createState() => _mycard1State();
}

//List<mycard1> fav = [];

class _mycard1State extends State<DetalesofCategoriesScreen> {
  static String? selectedId;

  @override
  Widget build(BuildContext context) {
    bool index = false;
    get(bool index) {
      if (index == false) {
        return Colors.white;
      }
      return Colors.black;
    }

    bool isSelected = (widget.id == selectedId);

    Color getIconColor() {
      return isSelected ? Colors.black : Colors.white;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
            //alignment: Alignment.center,
            Text(
          widget.title!,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: ListView(
        children: [
          ClipRRect(
              child: Image.network(
            widget.imageUrl!,
            width: double.infinity,
            height: 340,
            fit: BoxFit.cover,
          )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "الأنشطه",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.grey),
                boxShadow: const [
                  BoxShadow(offset: Offset.zero, color: Colors.black)
                ],
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${widget.activities![index]}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        height: 5,
                      ),
                    );
                  },
                  itemCount: widget.activities!.length),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "البرنامج اليومي",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.grey),
                boxShadow: const [
                  BoxShadow(offset: Offset.zero, color: Colors.black)
                ],
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.orangeAccent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("اليوم"),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "${index}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              "${widget.program![index]}",
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.visible,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Divider(
                        height: 5,
                      ),
                    );
                  },
                  itemCount: widget.program!.length),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            if (selectedId == widget.id) {
              selectedId = null;
            } else {
              selectedId = widget.id;

              favorite.add(TripScrean(
                  title: widget.title,
                  imageUrl: widget.imageUrl,
                  id: widget.id,
                  duration: widget.duration,
                  isInSummer: widget.isInSummer,
                  isInWinter: widget.isInWinter,
                  season: widget.season,
                  tripType: widget.tripType,
                  isForFamilies: widget.isForFamilies,
                  activities: widget.activities,
                  program: widget.program));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    "تم اضافه العنصر الي المفضله بنجاح",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  action: SnackBarAction(
                      label: "تم",
                      onPressed: () {
                        setState(() {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        });
                      }),
                ),
              );
            }
          });
        },
        child: Icon(
          Icons.favorite,
          color: getIconColor(),
        ),
      ),
    );
  }
}
