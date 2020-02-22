import 'package:flutter/material.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/extensions.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final int _itemCount = 4;
  int _currentItem = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentItem);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(height: 64.0),
          Spacer(),
          _buildItemsPager(),
          Spacer(),
          _buildCloseButton(),
          Container(height: 24.0),
          _buildItemsIndicator(),
          Container(height: 48.0),
        ],
      ),
    );
  }

  Widget _buildItemsPager() {
    return Container(
      height: 320.0,
      child: PageView(
        controller: _pageController,
        onPageChanged: (it) => setState(() => _currentItem = it),
        children: <Widget>[
          _buildItem(
            Images.introMagnifier,
            "Select host",
            "Either pick one of the search results or enter your own host and confirm your choice",
          ),
          _buildItem(
            Images.introGear,
            "Adjust settings",
            "Change host monitoring preferences and behavior of entire application",
          ),
          _buildItem(
            Images.introWaves,
            "Ping host",
            "Either perform a quick ping by long pressing play button or tap it to start ping session",
          ),
          _buildItem(
            Images.introBinders,
            "Save results",
            "Archive ping results to review them later and compare them with rest of the world",
          ),
        ],
      ),
    );
  }

  Widget _buildItem(AssetImage image, String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(image: image, width: 150, height: 150),
          Container(height: 40.0),
          Text(title, style: TextStyle(fontSize: 18.0)),
          Container(height: 40.0),
          Text(description, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildCloseButton() {
    return (_currentItem < _itemCount - 1)
        ? FlatButton(
            child: Text("Skip"),
            onPressed: pop,
          )
        : RaisedButton(
            child: Text("Got it!"),
            onPressed: pop,
          );
  }

  Widget _buildItemsIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(
        _itemCount,
        (it) => GestureDetector(
          onTap: () => _onItemDotTap(it),
          child: SizedBox(
            height: 48.0,
            width: 32.0,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox.fromSize(
                size: Size.square(it == _currentItem ? 24.0 : 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemDotTap(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
