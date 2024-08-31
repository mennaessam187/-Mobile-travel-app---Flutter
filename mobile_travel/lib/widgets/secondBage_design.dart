import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_travel/models/dataForTrip.dart';
import 'package:mobile_travel/screans/detalesOfCat_screan.dart';

class TripScrean extends StatelessWidget {
  String? title;
  String? imageUrl;
  String? id;
  int? duration;
  bool? isInSummer;
  bool? isInWinter;
  bool? isForFamilies;
  Season? season;
  TripType? tripType;
  List<String>? activities;
  List<String>? program;

  TripScrean({
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.duration,
    required this.isInSummer,
    required this.isInWinter,
    required this.season,
    required this.tripType,
    required this.isForFamilies,
    required this.activities,
    required this.program,
  });
  @override
  seson1() {
    if (season == Season.Winter) {
      return "شتاء";
    } else if (season == Season.Summer) {
      return "صيف";
    } else if (season == Season.Spring) {
      return "ربيع";
    }
    return "خريف";
  }

  seson2() {
    if (tripType == TripType.Exploration) {
      return "استكشاف";
    } else if (tripType == TripType.Recovery) {
      return "التعافي";
    } else if (tripType == TripType.Activities) {
      return "الأنشطه";
    }
    return "العلاج";
  }

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (contex) => DetalesofCategoriesScreen(
                          title: title,
                          activities: activities,
                          program: program,
                          imageUrl: imageUrl,
                          tripType: tripType,
                          duration: duration,
                          isForFamilies: isForFamilies,
                          isInSummer: isInSummer,
                          isInWinter: isInWinter,
                          id: id,
                          season: season,
                        )))
                .then((value) {});
          },
          child: Container(
            height: 310,
            width: 4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset.zero,
                  blurStyle: BlurStyle.solid,
                  color: Colors.black,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          imageUrl!,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )),
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        // color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(0.8),
                          ],
                          stops: [0.6, 1],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Color.fromARGB(255, 255, 222, 6),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "${duration.toString()} ايام",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.sunny_snowing,
                            color: Color.fromARGB(255, 255, 222, 6),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "${seson1()}",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.family_restroom,
                            color: Color.fromARGB(255, 255, 222, 6),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "${seson2()}",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
