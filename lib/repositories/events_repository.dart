import 'dart:io';
import 'package:events_poster/repositories/args_for_parsing_json.dart';
import 'package:events_poster/src/dto/event_dto.dart';
import 'package:events_poster/src/models/event.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class EventsRepository {
  static const String _clientId = 'Mjc0MTk4MjR8MTY1NTA2NTY1Ni42MDI3MDk';
  static const String _clientSecret =
      '107f29bed3667e3d505705a9a282d1fafde96fad36e0621e2b559b792aef3f5d';

  Future<List<Event>> fetchEventsByType(String type) async {
    List<Event> result = [];
    var client = http.Client();

    try {
      final url =
          'https://api.seatgeek.com/2/events?&per_page=60&type=$type&client_id=$_clientId&client_secret=$_clientSecret';
      var response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        result = await compute(parseEvents, ArgsForParsingJson(responseBody: response.body));
      } else {
        throw HttpException('Request failed with status: ${response.statusCode}');
      }
    } finally {
      client.close();
    }

    return result;
  }
}

List<Event> parseEvents(ArgsForParsingJson args) {
  List<Event> result = [];
  final jsonResponse = convert.jsonDecode(args.responseBody);
  var events = jsonResponse['events'] as Iterable<dynamic>;
  final dtos = events.cast<Map<String, dynamic>>().map((json) => EventDto.fromJson(json));
  if (dtos.isNotEmpty) {
    result = dtos.map((e) => args.createEventFromDto(e)).toList();
  }
  return result;
}
