import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'second_page.dart';
import 'third_page.dart';
import 'fourth_page.dart';
import 'fifth_page.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "스케치 전용",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  // const MyPage({Key? key}) : super(key: key);
  int _page = 0;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],
        title: Text(
          "첫번째 스케치",
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text("두번째 스케치로 이동"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                },
                child: Text("세번째 스케치로 이동"),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.moving_outlined),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FourthPage()),
                  );
                },
                child: Text("네번째 스케치로 이동"),
              ),
              OutlineButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FifthPage()),
                  );
                },
                child: Text("다섯번째 스케치로 이동"),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       final CurvedNavigationBarState? naveBarState =
              //           _bottomNavigationKey.currentState;
              //       naveBarState?.setPage(2);
              //     },
              //     child: Text('페이지 인덱스'))
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // backgroundColor: Colors.blueAccent,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.mail, size: 30),
          // Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
