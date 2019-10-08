# infinite_view_pager

Flutter infinite view pager widget

[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/infinite_view_pager.svg?style=social)](https://github.com/lesnitsky/infinite_view_pager)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_a.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_a)

## Installation

```yaml
dependencies:
  infinite_view_pager: ^1.0.0
```

## Example

```dart
class InfiniteViewPagerDemo extends StatefulWidget {
  @override
  _InfiniteViewPagerDemoState createState() => _InfiniteViewPagerDemoState();
}

class _InfiniteViewPagerDemoState extends State<InfiniteViewPagerDemo> {
  int index = 0;

  Widget _buildPage(BuildContext context, int direction) {
    return Container(
      padding: EdgeInsets.all(100.0),
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
      child: InfinitePageView(
        onPageChanged: (direction) {
          index += direction;
        },
        pageBuilder: _buildPage,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
```

## Author

[Andrei Lesnitsky](https://github.com/lesnitsky)

## License

MIT

[![GitHub stars](https://img.shields.io/github/stars/lesnitsky/infinite_view_pager.svg?style=social)](https://github.com/lesnitsky/infinite_view_pager)
[![Twitter Follow](https://img.shields.io/twitter/follow/lesnitsky_a.svg?label=Follow%20me&style=social)](https://twitter.com/lesnitsky_a)
