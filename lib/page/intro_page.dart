import 'package:flutter/material.dart';
import 'package:pinger/assets.dart';
import 'package:pinger/extensions.dart';
import 'package:pinger/resources.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Spacer(),
              _buildItemsPager(),
              Spacer(),
              _buildItemsIndicator(),
              Spacer(),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemsPager() {
    return Container(
      height: 360.0,
      child: PageView(
        controller: _pageController,
        onPageChanged: (it) => setState(() => _currentItem = it),
        children: <Widget>[
          _buildItem(
            Images.undrawSearching,
            "Select host",
            "Either pick one of the search results or enter your own host and confirm your choice",
          ),
          _buildItem(
            Images.undrawSettings,
            "Adjust settings",
            "Change host monitoring preferences and behavior of entire application",
          ),
          _buildItem(
            Images.undrawSignalSearching,
            "Ping host",
            "Either perform a quick ping by long pressing play button or tap it to start ping session",
          ),
          _buildItem(
            Images.undrawCollecting,
            "Save results",
            "Archive ping results to review them later and compare them with rest of the world",
          ),
        ],
      ),
    );
  }

  Widget _buildItem(AssetImage image, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image(image: image, width: 200.0, height: 200.0),
          Container(height: 40.0),
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Container(height: 16.0),
          Text(
            description,
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildItemsIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List<Widget>.generate(
        _itemCount,
        (it) => GestureDetector(
          onTap: () => _moveToPage(it),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            height: 16.0,
            width: it == _currentItem ? 32.0 : 16.0,
            decoration: BoxDecoration(
              color:
                  it == _currentItem ? R.colors.secondary : R.colors.grayLight,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return SizedBox(
      height: 64.0,
      child: Align(
        alignment: Alignment.center,
        child: (_currentItem < _itemCount - 1)
            ? Row(children: <Widget>[
                ButtonTheme.fromButtonThemeData(
                  data: R.themes.flatButton,
                  child: FlatButton(child: Text("SKIP"), onPressed: pop),
                ),
                Spacer(),
                SizedBox.fromSize(
                  size: Size.square(64.0),
                  child: RaisedButton(
                    padding: EdgeInsets.zero,
                    onPressed: _onNextPressed,
                    child: Icon(Icons.arrow_forward, size: 32.0),
                  ),
                ),
              ])
            : IntrinsicWidth(
                child: ButtonTheme.fromButtonThemeData(
                  data: R.themes.raisedButton,
                  child: RaisedButton(
                    onPressed: pop,
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Text(
                          "Get started",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox.fromSize(
                        size: Size.square(32.0),
                        child: Icon(Icons.arrow_forward, size: 24.0),
                      ),
                    ]),
                  ),
                ),
              ),
      ),
    );
  }

  void _onNextPressed() => _moveToPage(_currentItem + 1);

  void _moveToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
