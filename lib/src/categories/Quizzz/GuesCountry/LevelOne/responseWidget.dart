import 'package:flutter/material.dart';

class ResponseWidget extends StatefulWidget {
  final String responsedata;
  final String realresponse;
  final Function updateScore;
  final Function updateLive;

  const ResponseWidget(
      {super.key,
      required this.responsedata,
      required this.realresponse,
      required this.updateScore,
      required this.updateLive});

  @override
  State<StatefulWidget> createState() => _ResponseWidgetState();
}

class _ResponseWidgetState extends State<ResponseWidget> {
  bool _isfinish = false;
  Color containerColor = Colors.white;

  _handleFinish() {
    setState(() {
      containerColor = Colors.white;
      _isfinish=false;
    });
  }

  _handleTap() {
    setState(() {
      if (widget.responsedata == widget.realresponse) {
        widget.updateScore();
        containerColor = Colors.green.shade900;
       
      } else {
        widget.updateLive();
        containerColor = Colors.red.shade600;
      }
      _isfinish = true;
    });
     
  }

  @override
  Widget build(BuildContext context) {
    print(_isfinish);
    if(_isfinish){
      _handleFinish();
    }
    return Expanded(
      child: GestureDetector(
          onTap: _handleTap,
          child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 100,
              decoration: BoxDecoration(
                color: containerColor,
                border: Border.all(width: 3),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              margin: const EdgeInsets.all(5),
              child: Center(child: Text(widget.responsedata)))),
    );
  }
}
