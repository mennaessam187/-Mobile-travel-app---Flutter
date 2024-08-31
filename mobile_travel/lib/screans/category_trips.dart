import 'package:flutter/material.dart';
import 'package:mobile_travel/app_data.dart';
import 'package:mobile_travel/models/category.dart';
import 'package:mobile_travel/models/dataForTrip.dart';
import 'package:mobile_travel/screans/categories_screan.dart';
import '../widgets/secondBage_design.dart';
import '../models/dataForTrip.dart';

class trippage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rout =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catid = rout["id"];
    final cattitle = rout["title"];
    final filterdata = Trips_data.where(
      (element) {
        return element.categories!.contains(catid);
      },
    ).toList();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            cattitle!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return TripScrean(
              title: filterdata[index].title,
              imageUrl: filterdata[index].imageUrl,
              id: filterdata[index].id,
              duration: filterdata[index].duration,
              isInSummer: filterdata[index].isInSummer,
              isForFamilies: filterdata[index].isForFamilies,
              isInWinter: filterdata[index].isInWinter,
              season: filterdata[index].season,
              tripType: filterdata[index].tripType,
              activities: filterdata[index].activities,
              program: filterdata[index].program,
            );
          },
          itemCount: filterdata.length,
        ));
  }
}
