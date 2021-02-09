import 'package:happy_hours/model/club_model.dart';
import 'package:happy_hours/model/events_model.dart';

List<String> images = [
  "assets/images/image_01.jpg",
  "assets/images/image_01.jpg",
  "assets/images/image_01.jpg",
  "assets/images/image_01.jpg",
  "assets/images/image_01.jpg",
  "assets/images/image_01.jpg",
  "assets/images/image_01.jpg",
  "assets/images/image_01.jpg",
  "assets/images/image_01.jpg",
  "assets/images/image_01.jpg",


];

List<String> title = [
  "Hounted Ground",
  "Fallen In Love",
  "The Dreaming Moon",
  "Jack the Persian",
  "Jack the Persian",
  "Jack the Persian",
  "Jack the Persian",
  "Jack the Persian",
  "Jack the Persian",
  "Jack the Persian",
];


List<ClubModel> clubs = [
  ClubModel('Radio Bar Tirana',"assets/images/image_01.jpg", 'Desc Club 1', 3, 41.3201982, 19.8144181),
  ClubModel('KINO',"assets/images/image_01.jpg", 'Desc Club 2', 1,41.3214454,19.8166029),
  ClubModel('Nouvelle Vague Tirana',"assets/images/image_01.jpg", 'Desc Club 3', 4, 41.3206734,19.8139207),
  ClubModel('Izzy Living',"assets/images/image_01.jpg", 'Desc Club 4', 0, 41.3207338,19.8127244),
  ClubModel('Far Test',"assets/images/image_01.jpg", 'Desc Club 4', 0, 41.3199384,19.8029055)
];

List<EventModel> events = [
  EventModel('Dj Set with Mr ', 'Get your ticket at asd', '12asdas', DateTime(2020, 1, 24)),
  EventModel('Dj Set with Mr Cool', 'Get your tict', '12asdas', DateTime(2020, 1, 25)),
  EventModel('Dj Set with Mr Bool', 'Get your tket at', '12asdas', DateTime(2020, 2, 24)),
  EventModel('Dj Set with Mr Fool', 'Get y ticket at', '12asdas', DateTime(2020, 1, 24)),
  EventModel('Dj Set with Mr Tool', 'Get youricket at', '12asdas', DateTime(2020, 4, 24)),
  EventModel('Dj Set with Mr Gool', 'G your ticket at', '12asdas', DateTime(2020, 3, 24)),
  EventModel('Dj Set with Mr Colt', 'Getour ticket at', '12asdas', DateTime(2020, 1, 21)),
  EventModel('Dj Set with Mr Bolt', 'et your ticket at', '12asdas', DateTime(2020, 4, 5)),
  EventModel('Dj Set with Mr Lot', 'Get your ticket at', '12asdas', DateTime(2020, 1, 4)),
  EventModel('Dj Set with Mr God', 'Get your ticket at', '12asdas', DateTime(2020, 1, 14)),
];