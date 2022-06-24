import 'package:events_poster/ui/constants.dart';
import 'package:events_poster/src/models/event.dart';
import 'package:events_poster/ui/pages/event_details_page.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event? event;

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(event!.datetimeLocal as String);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailsPage(event: event),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 10),
              blurRadius: 50,
              color: kMediumPurpleColor.withOpacity(0.23),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 50.0,
              ),
              child: event!.performers![0].image != null
                  ? Image.network(event!.performers![0].image as String)
                  : Image.asset('assets/seatgeek_logo.png'),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    event?.shortTitle != null ? event!.shortTitle!.toUpperCase() : '',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '${dateTime.day}.${dateTime.month}.${dateTime.year}',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          event!.venue?.city ?? '',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
