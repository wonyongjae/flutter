import 'dart:math';
import 'package:flutter/material.dart';

class SaturnLoading extends StatefulWidget {
  // const SaturnLoading({Key? key}) : super(key: key);
  _SaturnLoadingState _satrunLoading = _SaturnLoadingState();

  void start() {
    _satrunLoading.start();
  }

  void stop() {
    _satrunLoading.stop();
  }

  @override
  _SaturnLoadingState createState() => _SaturnLoadingState();
}

class _SaturnLoadingState extends State<SaturnLoading>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animaton;

  void stop() {
    _animationController!.stop(canceled: true);
  }

  void start() {
    _animationController!.repeat();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animaton =
        Tween<double>(begin: 0, end: pi * 2).animate(_animationController!);
    _animationController!.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            children: <Widget>[
              Image.asset(
                'repo/images/circle.png',
                width: 100,
                height: 100,
              ),
              Center(
                child: Image.asset(
                  'repo/images/sunny.png',
                  width: 30,
                  height: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Transform.rotate(
                  angle: _animaton!.value,
                  origin: Offset(35, 35),
                  child: Image.asset(
                    'repo/images/saturn.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
