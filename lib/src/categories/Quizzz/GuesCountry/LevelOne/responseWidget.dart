import 'package:audioplayers/audioplayers.dart';
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
  final myaudioplayer = AudioPlayer();

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
         myaudioplayer.play(AssetSource('audios/correct_answer.wav'));
        //myaudioplayer.stop();
        
        containerColor = Colors.green.shade900;
       
      } else {
         myaudioplayer.play(AssetSource('audios/wrong_answer_buzz.wav'));
        // myaudioplayer.stop();
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
              child: Center(child: Text(widget.responsedata, style: TextStyle(fontSize: 20, color: Colors.black),)))),
    );
  }
}
