import 'package:flutter/material.dart';
import 'package:infinite_view_pager/infinite_view_pager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite View Pager Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Infinite View Pager'),
        ),
        body: Stack(
          children: <Widget>[
            InfiniteViewPagerDemo(),
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.arrow_upward,
                size: 48,
                color: Colors.grey,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Icon(
                Icons.arrow_downward,
                size: 48,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfiniteViewPagerDemo extends StatefulWidget {
  @override
  _InfiniteViewPagerDemoState createState() => _InfiniteViewPagerDemoState();
}

class _InfiniteViewPagerDemoState extends State<InfiniteViewPagerDemo> {
  int index = 0;

  Widget _buildPage(BuildContext context, int direction) {
    return Container(
      padding: const EdgeInsets.all(50.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        child: Center(
          child: Text(
            (index + direction).toString(),
            style: Theme.of(context).textTheme.display4,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InfiniteViewPager(
        onPageChanged: (direction) {
          index += direction;
        },
        pageBuilder: _buildPage,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
