import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app_paralax_effect_flutter/mocks/mock_all_destinations.dart';

import 'destination_item.dart';

class AllDestinations extends StatefulWidget {
  final double padding;
  final double spacing;

  const AllDestinations(
      {Key? key, required this.padding, required this.spacing})
      : super(key: key);

  @override
  State<AllDestinations> createState() => _AllDestinationsState();
}

class _AllDestinationsState extends State<AllDestinations> {
  static const _imageWidht = 230.0;

  late final ScrollController _scrollController;
  late final double _indexFactor;

  double _imageOffset = 0.0;

  @override
  void initState() {
    final deviceWidht =
        (window.physicalSize.shortestSide / window.devicePixelRatio);
    _indexFactor = (widget.spacing + _imageWidht) / deviceWidht;
    _imageOffset = -widget.padding / deviceWidht;

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _imageOffset =
            ((_scrollController.offset - widget.padding) / deviceWidht);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: widget.padding),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: widget.spacing),
        itemCount: MockAllDestinations.data.length,
        itemBuilder: (_, index) => DestinationItem(
            index: index,
            details: MockAllDestinations.data[index],
            imageWidth: _imageWidht,
            imageOffset: _imageOffset,
            indexFactor: _indexFactor),
      ),
    );
  }
}
