import 'package:events_poster/stores/favorites_events_store.dart';
import 'package:events_poster/ui/constants.dart';
import 'package:events_poster/src/models/event.dart';
import 'package:events_poster/ui/widgets/event_item.dart';
import 'package:events_poster/ui/widgets/wave_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FavoritesEventsPage extends StatelessWidget {
  const FavoritesEventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              floating: true,
              delegate: FavoriteAppBarDelegate(),
            ),
            _buildFavorites(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFavorites(BuildContext context) {
    return Observer(builder: (context) {
      final favoritesStore = Provider.of<FavoritesEventsStore>(context);
      if (favoritesStore.favoritesIsEmpty) {
        return const SliverToBoxAdapter(
          child: Center(
            child: Expanded(
              child: Text(
                'List of favorites events is empty',
                style: TextStyle(
                  fontSize: 18.0,
                ),
                maxLines: 5,
              ),
            ),
          ),
        );
      } else {
        return _buildLoadSuccess(favoritesStore.favoritesMap.values.toList());
      }
    });
  }

  Widget _buildLoadSuccess(List<Event>? events) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return EventItem(
            event: events?[index],
          );
        }, childCount: events != null ? events.length : 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
      ),
    );
  }
}

class FavoriteAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: 130.0,
      width: double.infinity,
      child: CustomPaint(
        painter: WavePainter(),
        child: const Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            'Favorites events',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 3,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 130.0;

  @override
  double get minExtent => 130.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
