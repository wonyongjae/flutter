import 'package:flutter/material.dart';
import 'people.dart';
import 'secondPage.dart';
import 'intro.dart';
import 'sliverPage.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
    );
  }
}

class AnimationApp extends StatefulWidget {
  const AnimationApp({Key? key}) : super(key: key);

  @override
  _AnimationAppState createState() => _AnimationAppState();
}

class _AnimationAppState extends State<AnimationApp> {
  List<People> peoples = new List.empty(growable: true);
  Color weightColor = Colors.blue;
  double _opacity = 1;
  int current = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    peoples.add(People('용재1', 180, 92));
    peoples.add(People('용재2', 162, 55));
    peoples.add(People('용재3', 176, 67));
    peoples.add(People('용재4', 171, 80));
    peoples.add(People('용재5', 155, 61));
    peoples.add(People('용재6', 167, 53));
    peoples.add(People('용재7', 177, 72));
    peoples.add(People('용재8', 148, 43));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: SizedBox(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                          width: 100,
                          child: Text('이름 ${peoples[current].name}')),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.bounceIn,
                        color: Colors.amber,
                        child: Text(
                          '키 ${peoples[current].height}',
                          textAlign: TextAlign.center,
                        ),
                        width: 50,
                        height: peoples[current].height,
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInCubic,
                        color: weightColor,
                        child: Text(
                          '몸무게 ${peoples[current].weight}',
                          textAlign: TextAlign.center,
                        ),
                        width: 50,
                        height: peoples[current].weight,
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.linear,
                        color: Colors.pinkAccent,
                        child: Text(
                          'Bmi ${peoples[current].bmi.toString().substring(0, 2)}',
                          textAlign: TextAlign.center,
                        ),
                        width: 50,
                        height: peoples[current].bmi,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                  height: 200,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (current < peoples.length - 1) {
                      current++;
                    }
                    _changeWeightColor(peoples[current].weight!);
                  });
                },
                child: Text('다음'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (current > 0) {
                      current--;
                    }
                    _changeWeightColor(peoples[current].weight!);
                  });
                },
                child: Text('이전'),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _opacity == 1 ? _opacity = 0 : _opacity = 1;
                    });
                  },
                  child: Text('On/Off')),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SecondPage()));
                  });
                },
                child: SizedBox(
                  width: 200,
                  child: Row(
                    children: <Widget>[
                      Hero(tag: 'detail', child: Icon(Icons.cake)),
                      Text("이동하기"),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SliverPage()));
                  },
                  child: Text('페이지 이동'))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }

  void _changeWeightColor(double weight) {
    if (weight < 40) {
      weightColor = Colors.lightGreen;
    } else if (weight < 60) {
      weightColor = Colors.lightBlue;
    } else if (weight < 80) {
      weightColor = Colors.orange;
    } else {
      weightColor = Colors.red;
    }
  }
}
