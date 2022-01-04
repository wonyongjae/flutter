import 'package:flutter/material.dart';
import 'package:listview_ex/sub/firstPage.dart';
import 'package:listview_ex/sub/secondPage.dart';
import 'animalItem.dart';
import 'cupertinoMain.dart';

//
void main() {
  runApp(CupertinoMain());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      //title: 'Flutter Demo Home Page'
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({Key? key}) : super(key: key);
  //this.title

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  List<Animal> animalList = new List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(
        Animal(animalName: "벌", kind: "곤충", imagePath: "repo/images/bee.png"));
    animalList.add(Animal(
        animalName: "고양이", kind: "포유류", imagePath: "repo/images/cat.png"));
    animalList.add(Animal(
        animalName: "젖소", kind: "포유류", imagePath: "repo/images/cow.png"));
    animalList.add(Animal(
        animalName: "강아지", kind: "포유류", imagePath: "repo/images/dog.png"));
    animalList.add(Animal(
        animalName: "여우", kind: "포유류", imagePath: "repo/images/fox.png"));
    animalList.add(Animal(
        animalName: "원숭이", kind: "영장류", imagePath: "repo/images/monkey.png"));
    animalList.add(Animal(
        animalName: "돼지", kind: "포유류", imagePath: "repo/images/pig.png"));
    animalList.add(Animal(
        animalName: "늑대", kind: "포유류", imagePath: "repo/images/wolf.png"));

    controller!.addListener(() {
      if (!controller!.indexIsChanging) {
        print("이전 index, ${controller!.previousIndex}");
        print("현재 index, ${controller!.index}");
        print("전체 탭 길이, ${controller!.length}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listview Example'),
        ),
        body: TabBarView(
          children: [FirstApp(list: animalList), SecondApp(list: animalList)],
          controller: controller,
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.looks_one, color: Colors.blue),
            ),
            Tab(
              icon: Icon(Icons.looks_two, color: Colors.blue),
            )
          ],
          controller: controller,
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }
}
