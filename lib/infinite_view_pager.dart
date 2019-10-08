library infinite_view_pager;

import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class InfiniteViewPager extends StatefulWidget {
  /// [IndexedWidgetBuilder] which is called each time view pager needs to build a page.
  /// index argument indicates the offset from the visible page (-1 for previous page, 1 for next, 0 for current).
  final IndexedWidgetBuilder pageBuilder;

  /// Called each time page changes with an integer representing direction (1 – forward, -1 – backward)
  final Function(int) onPageChanged;

  /// See [PageView.dragStartBehavior]
  final DragStartBehavior dragStartBehavior;

  /// See [PageView.pageSnapping]
  final bool pageSnapping;

  /// See [PageView.physics]
  final ScrollPhysics physics;

  /// See [PageView.reverse]
  final bool reverse;

  /// See [PagView.scrollDirection]
  final Axis scrollDirection;

  const InfiniteViewPager({
    Key key,
    @required this.pageBuilder,
    this.onPageChanged,
    this.dragStartBehavior = DragStartBehavior.start,
    this.pageSnapping = true,
    this.physics,
    this.reverse = false,
    this.scrollDirection = Axis.horizontal,
  }) : super(key: key);

  @override
  _InfiniteViewPagerState createState() => _InfiniteViewPagerState();
}

class _InfiniteViewPagerState extends State<InfiniteViewPager> {
  PageController controller;
  List<Widget> _children = new List<Widget>(3);

  @override
  void initState() {
    controller = new PageController(initialPage: 1);
    controller.addListener(_onScroll);

    super.initState();
  }

  _buildChildren() {
    for (int i = 0; i < 3; i++) {
      _children[i] = widget.pageBuilder(context, i - 1);
    }
  }

  _onScroll() {
    if (_children.every((c) => c == null)) {
      return;
    }

    if (controller.page.toInt() == controller.page) {
      final direction = controller.page - 1;

      setState(() {
        _buildChildren();
        (widget.onPageChanged ?? _noop)(direction.toInt());
      });

      if (_children.first == null || _children.last == null) {
        return;
      }

      controller.jumpToPage(1);
    }
  }

  _noop(int) {}

  @override
  void dispose() {
    controller.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_children.every((c) => c == null)) {
      _buildChildren();
    }

    return PageView.builder(
      controller: controller,
      dragStartBehavior: widget.dragStartBehavior,
      itemBuilder: (context, index) {
        if (_children.first == null) {
          index++;
        }

        if (_children.last == null) {
          index--;
        }

        return _children[index];
      },
      itemCount: _children.where((child) => child != null).length,
      pageSnapping: widget.pageSnapping,
      physics: widget.physics,
      reverse: widget.reverse,
      scrollDirection: widget.scrollDirection,
    );
  }
}
