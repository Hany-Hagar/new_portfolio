import 'package:flutter/material.dart';
import 'package:mosaic_grid/mosaic_grid.dart';

class CustomList<T> extends StatelessWidget {
  final double gap;
  final List<T> items;
  final Widget? header;
  final EdgeInsets padding;
  final List<int> columnSpans;
  final Widget Function(T item) itemBuilder;

  const CustomList({
    super.key,
    this.header,
    this.gap = 16,
    required this.items,
    required this.columnSpans,
    required this.itemBuilder,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return MosaicGrid.builder(
      rowGap: gap,
      columnGap: gap,
      header: header,
      shrinkWrap: true,
      padding: padding,
      itemCount: items.length,
      columns: const MosaicColumns.count(12),
      columnSpan: (index) => columnSpans[index],
      physics: const NeverScrollableScrollPhysics(),
      layout: const MosaicLayout.rows(fit: MosaicRowFit.stretch),
      itemBuilder: (context, index) => itemBuilder(items[index]),
    );
  }
}
