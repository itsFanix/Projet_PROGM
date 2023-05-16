import 'dart:convert';
import 'package:flutter/material.dart';

import 'QuizModel.dart';
import 'package:http/http.dart' as http;
class QuizApi {





   static Future<List<Quiz>> getRandomQuiz() async  {
   // 'X-Rapidapi-Key': '2c64779b45msh9678488572c5e4fp131716jsn600dda2890e9'

  final httpsUri = Uri.https('ases-quiz-api1.p.rapidapi.com' , '/questions/random/20',{}); 

  final response = await  http
    .get(httpsUri, headers:  {"X-Rapidapi-Key": "2c64779b45msh9678488572c5e4fp131716jsn600dda2890e9",
"X-Rapidapi-Host": "ases-quiz-api1.p.rapidapi.com",
"Host": "ases-quiz-api1.p.rapidapi.com"});



print(response.statusCode);
    if (response.statusCode ==200) {
      print(response.body);

      var res= jsonDecode(response.body)['questions'];
   
  //  return List.empty();
   return List<Quiz>.from(res.map((data) => Quiz.fromJson(data)));
    }
  else {
    // print(response.body);
    throw Exception('Failed to load quizz');
  }


}
}