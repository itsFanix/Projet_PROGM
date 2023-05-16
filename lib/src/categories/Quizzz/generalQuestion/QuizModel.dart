
class Quiz{

  late final String question;
  late final List options;
  late final String category;
  late  final  String difficulty;


  Quiz({
    required this.question,
    required this.options,
    required this.category,
    required this.difficulty,
  });


  factory Quiz.fromJson(Map<String, dynamic> json){

    return Quiz(
      question: json['text'],
      options: json['options'],
      category: json['category']['name'],
      difficulty: json['difficulty']['degree']
    );
  }




}