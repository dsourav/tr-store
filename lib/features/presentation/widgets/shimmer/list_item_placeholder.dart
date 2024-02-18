import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'place_holders/place_holders.dart';

class ListItemPlaceholder extends StatelessWidget {
  const ListItemPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Column(
        children: List.generate(
            8,
            (index) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ContentPlaceholder(lineType: ContentLineType.threeLines),
                )).toList(),
      ),
    );
  }
}
