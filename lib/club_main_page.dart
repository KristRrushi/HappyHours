import 'package:flutter/material.dart';
import 'package:happy_hours/model/events_model.dart';
import 'data/data.dart';
import 'helpers/Helpers.dart';

class ClubMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0x44000000).withOpacity(1),
            elevation: 0.0,
            floating: false,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Radio Bar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    child:
                        Image(image: AssetImage(images[1]), fit: BoxFit.fill),
                  ),
                  Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 16.0, bottom: 24.0),
                        child: _clubInfo(),
                      ))
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 70.0,
            delegate: SliverChildListDelegate(_listOfEventes(events)),
          )
        ],
      ),
    );
  }

  List<Widget> _listOfEventes(List<EventModel> events) {
    return events.map((event) => listItem(event)).toList();
  }

  Widget _clubInfo() {
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.access_time,
                color: Colors.white,
              ),
              Text(
                '8AM - 1AM',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.date_range,
                color: Colors.white,
              ),
              Text(
                'Hene - Diele',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              Text(
                'Rruga Ismail Qemali',
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget listItem(EventModel event) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: GestureDetector(
            onTap: () {
              print(title);
            },
            child: Stack(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Image(
                        image: AssetImage(images[1]),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          event.eventName,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(event.eventDesc)
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(dayParser(event.data),
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87)),
                        Text(monthParser(event.data))
                      ],
                    ),
                  ),
                )
              ],
            )),
      );
}