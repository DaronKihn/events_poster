import 'package:events_poster/ui/constants.dart';
import 'package:events_poster/src/models/event.dart';
import 'package:events_poster/stores/events_store.dart';
import 'package:events_poster/stores/types_store.dart';
import 'package:events_poster/ui/widgets/event_item.dart';
import 'package:events_poster/ui/widgets/loading_animation.dart';
import 'package:events_poster/ui/widgets/types_filter_bar_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SearchEventsPage extends StatefulWidget {
  SearchEventsPage({Key? key}) : super(key: key);

  @override
  State<SearchEventsPage> createState() => _SearchEventsPageState();
}

class _SearchEventsPageState extends State<SearchEventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            _buildFilterBar(context),
            _buildEvents(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context) {
    return Observer(
      builder: (context) {
        final typesStore = Provider.of<TypesStore>(context);

        return SliverPersistentHeader(
          floating: true,
          delegate: TypesFilterBarDelegate(
              types: typesStore.types,
              selectedType: typesStore.selectedType,
              onTypeSelected: (eventType) {
                typesStore.selectType(eventType);
              }),
        );
      },
    );
  }

  Widget _buildEvents(BuildContext context) {
    return Observer(
      builder: (context) {
        final eventsStore = Provider.of<EventsStore>(context);
        switch (eventsStore.state) {
          case EventsStoreState.initial:
            print('initial');
            return const SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: LoadingAnimation(),
                ),
              ),
            );
          case EventsStoreState.loading:
            print('loading___');
            return const SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: LoadingAnimation(),
                ),
              ),
            );
          case EventsStoreState.failure:
            print('failure');
            return SliverToBoxAdapter(
              child: Center(
                child: Expanded(
                  child: Text(
                    eventsStore.errorMessage ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            );
          case EventsStoreState.loaded:
            print('loaded');
            return _buildLoadSuccess(eventsStore.events);
        }
      },
    );
  }

  SliverPadding _buildLoadSuccess(List<Event>? events) {
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
