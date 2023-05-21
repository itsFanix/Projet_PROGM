import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../country_model.dart';

class ResponseCapital extends StatefulWidget {
  final  Country responsedata;
  final  Country  realresponse;
  final Function updateScore;
  final Function updateLive;

  const ResponseCapital(
      {super.key,
      required this.responsedata,
      required this.realresponse,
      required this.updateScore,
      required this.updateLive});

  @override
  State<StatefulWidget> createState() => _ResponseCapitalState();
}

class _ResponseCapitalState extends State<ResponseCapital> {
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
      if (widget.responsedata.name == widget.realresponse.name) {
         myaudioplayer.play(AssetSource('audios/correct_answer.wav'));
        widget.updateScore();
        containerColor = Colors.green.shade900;
       
       
      } else {
         myaudioplayer.play(AssetSource('audios/wrong_answer_buzz.wav'));
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
              child:SvgPicture.network(widget.responsedata.flag) ))
    );
  }
}
