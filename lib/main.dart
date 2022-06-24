import 'package:events_poster/repositories/events_repository.dart';
import 'package:events_poster/src/models/event.dart';
import 'package:events_poster/src/models/location.dart';
import 'package:events_poster/src/models/performer.dart';
import 'package:events_poster/src/models/stats.dart';
import 'package:events_poster/src/models/taxonomy.dart';
import 'package:events_poster/src/models/venue.dart';
import 'package:events_poster/stores/events_store.dart';
import 'package:events_poster/stores/favorites_events_store.dart';
import 'package:events_poster/stores/types_store.dart';
import 'package:events_poster/ui/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  // Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter<Event>(EventAdapter());
  Hive.registerAdapter<Location>(LocationAdapter());
  Hive.registerAdapter<Performer>(PerformerAdapter());
  Hive.registerAdapter<Stats>(StatsAdapter());
  Hive.registerAdapter<Taxonomy>(TaxonomyAdapter());
  Hive.registerAdapter<Venue>(VenueAdapter());
  await Hive.openBox<Event>('favorites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => EventsRepository(),
        ),
        Provider(
          create: (context) => TypesStore(),
        ),
        Provider(
          create: (context) => EventsStore(
            context.read<EventsRepository>(),
            context.read<TypesStore>(),
          ),
        ),
        Provider(
          create: (context) => FavoritesEventsStore(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: RootPage(),
      ),
    );
  }
}
