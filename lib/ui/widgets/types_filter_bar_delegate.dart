import 'package:events_poster/src/models/event_type.dart';
import 'package:events_poster/ui/widgets/custom_filter_chip.dart';
import 'package:events_poster/ui/widgets/wave_painter.dart';
import 'package:flutter/material.dart';

class TypesFilterBarDelegate extends SliverPersistentHeaderDelegate {
  final List<EventType> types;
  final ValueChanged<EventType> onTypeSelected;
  final EventType selectedType;

  TypesFilterBarDelegate({
    required this.types,
    required this.onTypeSelected,
    required this.selectedType,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: 130.0,
      width: double.infinity,
      child: CustomPaint(
        painter: WavePainter(),
        child: TypesFilterBar(
          types: types,
          onTypeSelected: onTypeSelected,
          selectedType: selectedType,
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

class TypesFilterBar extends StatefulWidget {
  const TypesFilterBar(
      {Key? key, required this.types, required this.onTypeSelected, required this.selectedType})
      : super(key: key);

  final List<EventType> types;
  final ValueChanged<EventType> onTypeSelected;
  final EventType selectedType;

  @override
  State<TypesFilterBar> createState() => _TypesFilterBarState();
}

class _TypesFilterBarState extends State<TypesFilterBar> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.only(top: 24.0, bottom: 60.0),
        child: CustomFilterChip(
          text: widget.types[index].name,
          isActive: widget.selectedType.value == widget.types[index].value,
          onTap: () {
            widget.onTypeSelected.call(widget.types[index]);
          },
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10.0),
      itemCount: widget.types.length,
    );
  }
}
