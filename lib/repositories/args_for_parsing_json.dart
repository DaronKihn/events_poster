import 'package:events_poster/src/dto/event_dto.dart';
import 'package:events_poster/src/dto/location_dto.dart';
import 'package:events_poster/src/dto/performer_dto.dart';
import 'package:events_poster/src/dto/stats_dto.dart';
import 'package:events_poster/src/dto/taxonomy_dto.dart';
import 'package:events_poster/src/dto/venue_dto.dart';
import 'package:events_poster/src/models/event.dart';
import 'package:events_poster/src/models/location.dart';
import 'package:events_poster/src/models/performer.dart';
import 'package:events_poster/src/models/stats.dart';
import 'package:events_poster/src/models/taxonomy.dart';
import 'package:events_poster/src/models/venue.dart';

class ArgsForParsingJson {
  final String responseBody;

  ArgsForParsingJson({required this.responseBody});

  Event createEventFromDto(EventDto? dto) {
    return Event(
      id: dto?.id,
      type: dto?.type,
      title: dto?.title,
      shortTitle: dto?.short_title,
      url: dto?.url,
      datetimeLocal: dto?.datetime_local,
      datetimeUtc: dto?.datetime_utc,
      stats: _createStatsFromDto(dto?.stats),
      performers: dto?.performers?.map((e) => _createPerformerFromDto(e)).toList(),
      venue: _createVenueFromDto(dto?.venue),
      score: dto?.score,
      taxonomies: dto?.taxonomies?.map((e) => _createTaxonomyFromDto(e)).toList(),
    );
  }

  Location _createLocationFromDto(LocationDto? dto) {
    return Location(
      lat: dto?.lat,
      lon: dto?.lon,
    );
  }

  Taxonomy _createTaxonomyFromDto(TaxonomyDto? dto) {
    return Taxonomy(
      id: dto?.id,
      name: dto?.name,
    );
  }

  Stats _createStatsFromDto(StatsDto? dto) {
    return Stats(
      listingCount: dto?.listing_count,
      averagePrice: dto?.average_price,
      lowestPrice: dto?.lowest_price,
      highestPrice: dto?.highest_price,
    );
  }

  Performer _createPerformerFromDto(PerformerDto? dto) {
    return Performer(
      name: dto?.name,
      shortName: dto?.short_name,
      url: dto?.url,
      image: dto?.image,
      id: dto?.id,
      taxonomies: dto?.taxonomies?.map((e) => _createTaxonomyFromDto(e)).toList(),
    );
  }

  Venue _createVenueFromDto(VenueDto? dto) {
    return Venue(
      id: dto?.id,
      city: dto?.city,
      name: dto?.name,
      extendedAddress: dto?.extended_address,
      url: dto?.url,
      country: dto?.country,
      state: dto?.state,
      score: dto?.score,
      postalCode: dto?.postal_code,
      location: _createLocationFromDto(dto?.location),
      address: dto?.address,
    );
  }
}
