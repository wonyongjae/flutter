import 'package:flutter/cupertino.dart';
import '../animalItem.dart';
import '../cupertinoMain.dart';
import 'package:flutter/material.dart';

//
class CupertinoDesignPage extends StatefulWidget {
  // const CupertinoDesignPage({ Key? key }) : super(key: key);

  @override
  _CupertinoDesignPageState createState() => _CupertinoDesignPageState();
}

class _CupertinoDesignPageState extends State<CupertinoDesignPage> {
  FixedExtentScrollController? firstController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstController = FixedExtentScrollController(initialItem: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: CupertinoButton(
            child: Icon(Icons.arrow_back_ios), onPressed: () {}),
        middle: Text('Cupertino Design'),
        trailing:
            CupertinoButton(child: Icon(Icons.exit_to_app), onPressed: () {}),
      ),
      body: Container(
        child: Center(
          child: Column(children: [
            // CupertinoSlider(value: _value,
            // onChanged: (index){
            //   setState(() {
            //     _value = index;
            //   });
            // },)
            CupertinoButton(
                child: Text('Picker'),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 400,
                        child: Column(
                          children: [
                            Expanded(
                              child: CupertinoPicker(
                                itemExtent: 50,
                                backgroundColor: Colors.white,
                                scrollController: firstController,
                                onSelectedItemChanged: (index) {},
                                children: List<Widget>.generate(10, (index) {
                                  return Center(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          (++index).toString(),
                                        )),
                                  );
                                }),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('취소'))
                          ],
                        ),
                      );
                    },
                  );
                }),
          ], mainAxisAlignment: MainAxisAlignment.spaceAround),
        ),
      ),
    );
  }
}
