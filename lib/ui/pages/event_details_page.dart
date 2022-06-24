import 'package:events_poster/src/models/event.dart';
import 'package:events_poster/stores/favorites_events_store.dart';
import 'package:events_poster/stores/types_store.dart';
import 'package:events_poster/ui/constants.dart';
import 'package:events_poster/ui/widgets/wave_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsPage extends StatelessWidget {
  final Event? event;
  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 130.0,
              width: double.infinity,
              child: CustomPaint(
                painter: WavePainter(),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    event?.title ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: kWhiteColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
            ),
            if (event!.performers![0].image != null)
              Image.network(event!.performers![0].image as String)
            else
              const SizedBox(),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: <Widget>[
                  _buildRowDetails('Country', event?.venue?.country),
                  _buildRowDetails('City', event?.venue?.city),
                  _buildRowDetails('Address', event?.venue?.address),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomElevatedButton(onTap: () {
                  if (event?.url != null) {
                    launch(event!.url as String);
                  }
                }),
                const SizedBox(
                  width: 20.0,
                ),
                Observer(builder: (context) {
                  final favoritesStore = Provider.of<FavoritesEventsStore>(context);
                  final isFavorite = favoritesStore.favoritesMap.containsKey(event!.id.toString());
                  return AddToFavoritesButton(isFavorite: isFavorite, event: event!);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildRowDetails(String? text1, String? text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text(
            text1 ?? '',
            style: const TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text2 ?? '',
            textAlign: TextAlign.right,
            style: const TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final Function()? onTap;
  const CustomElevatedButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: kMediumPurpleColor,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),
            child: Text(
              'Buy ticket',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddToFavoritesButton extends StatelessWidget {
  final bool isFavorite;
  final Event event;
  const AddToFavoritesButton({Key? key, required this.isFavorite, required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<FavoritesEventsStore>(context, listen: false).onFavoritePress(event);
      },
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: kMediumPurpleColor,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),
            child: Icon(
              Icons.favorite,
              color: isFavorite ? kFavoriteColor : kWhiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
