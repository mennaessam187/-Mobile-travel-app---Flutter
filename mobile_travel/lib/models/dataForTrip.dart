// ignore_for_file: constant_identifier_names

class Trip {
  String? id;
  List<String>? categories;
  String? title;
  String? imageUrl;
  List<String>? activities;
  List<String>? program;
  int? duration;
  Season? season;
  TripType? tripType;
  bool? isInSummer;
  bool? isInWinter;
  bool? isForFamilies;
  Trip({
    this.id,
    this.categories,
    this.title,
    this.tripType,
    this.season,
    this.imageUrl,
    this.duration,
    this.activities,
    this.program,
    this.isInSummer,
    this.isForFamilies,
    this.isInWinter,
  });
}

enum Season {
  Winter,
  Summer,
  Spring,
  Autumn,
}

enum TripType {
  Exploration,
  Recovery,
  Activities,
  Therapy,
}
