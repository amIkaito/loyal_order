import 'package:flutter/material.dart';

class WalkthroughScreen extends StatefulWidget {
  @override
  _WalkthroughScreenState createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: PageView(
          controller: _controller,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          children: [
            _buildWalkthroughPage(''),
            _buildWalkthroughPage2('Walkthrough Page 2'),
            _buildWalkthroughPage3('Walkthrough Page 3'),
          ],
        ),
      ),
      bottomSheet: _buildPageIndicator(),
    );
  }

  Widget _buildWalkthroughPage(String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            text,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          Text(
            'LOYAL ORDER\nカスタムメイドへ\nようこそ', // 2つ目のテキスト
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: FontWeight * 0.7, // 画面の幅の70%
            child: Text(
              'あなただけの\n完璧なキックパンツを\n設計しましょう。',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Spacer(),
          Container(
            width: 200.0,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('ログイン / 新規作成',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
          SizedBox(height: 50.0),
        ],
      ),
    );
  }

  Widget _buildWalkthroughPage2(String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            text,
            style: TextStyle(
              fontSize: responsiveFontSize(context, 24.0),
              color: Colors.white,
            ),
          ),
          Text(
            'サンプルテキスト2',
            style: TextStyle(
              fontSize: responsiveFontSize(context, 24.0),
              color: Colors.white,
            ),
          ),
          Text(
            'サンプルテキスト3',
            style: TextStyle(
              fontSize: responsiveFontSize(context, 24.0),
              color: Colors.white,
            ),
          ),
          Spacer(),
          Container(
            width: responsiveWidth(context, 0.5), // screen's 50%
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'ログイン / 新規作成',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 50.0),
        ],
      ),
    );
  }

  double responsiveFontSize(BuildContext context, double baseSize) {
    double width = MediaQuery.of(context).size.width;
    if (width < 400) {
      return baseSize * 0.85; // reduce the size by 15%
    } else {
      return baseSize;
    }
  }

  double responsiveWidth(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * percent;
  }

  Widget _buildWalkthroughPage3(String text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            text,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          Text(
            'サンプルテキスト2', // 2つ目のテキスト
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          Text(
            'サンプルテキスト3', // 3つ目のテキスト
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Container(
            width: 200.0,
            height: 50.0,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('ログイン / 新規作成',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
          SizedBox(height: 50.0),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            bool isActive = _currentPage == index;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: 12.0,
              width: isActive ? 24.0 : 12.0, // 現在のページのときだけ横長にする
              decoration: BoxDecoration(
                color: isActive ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(6), // 角を丸くする
              ),
            );
          }),
        ),
      ),
    );
  }
}
