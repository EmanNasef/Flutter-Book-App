import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:task/Models/CalenderModel.dart';
import 'package:task/APIs/CalenderAPI.dart';

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  FetchAPI fetchAPI = FetchAPI();
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            calendarController: _calendarController,
            calendarStyle: CalendarStyle(
              todayColor: Colors.teal,
              selectedColor: Theme.of(context).primaryColor,
            ),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
            ),
            onDaySelected: (date, events, e) {
              showBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: height / (2),
                  width: width,
                  child: FutureBuilder(
                      future: fetchAPI.fetchCalender(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done)
                          return Center(child: CircularProgressIndicator());

                        List<CalenderModel> calenderData = snapshot.data;

                        return Column(
                          children: [
                            Center(
                              child: Text(
                                date.toUtc().toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: calenderData.length,
                                  itemBuilder: (context, int index) {
                                    return MyCard(
                                      title: calenderData[index].title,
                                      details: calenderData[index].note,
                                    );
                                  }),
                            ),
                          ],
                        );
                      }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MyCard extends StatelessWidget {
  String title;
  String details;
  MyCard({this.title, this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('\n$details')
          ],
        ),
      ),
    );
  }
}
