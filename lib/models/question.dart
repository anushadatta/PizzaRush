class Question
{
  String id;
  String question;
  String topic;
  String level;
  String storyContext;
  String character; 
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  String correctanswer;
  String imageUrl;
  String hint;
  int points;

  Question({
    this.id,
    this.question,
    this.level,
    this.topic,
    this.storyContext,
    this.character,
    this.answer1,
    this.answer2,
    this.answer3,
    this.answer4,
    this.correctanswer,
    this.imageUrl,
    this.hint,
    this.points
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> q = new Map<String, dynamic>();
    q['id'] = this.id;
    q['question'] = this.question;
    q['level'] = this.level;
    q['topic'] = this.topic;
    q['storyContext'] = this.storyContext;
    q['character'] = this.character;
    q['answer1'] = this.answer1;
    q['answer2'] = this.answer2;
    q['answer3'] = this.answer3;
    q['answer4'] = this.answer4;
    q['correctanswer'] = this.correctanswer;
    q['imageUrl'] = this.imageUrl;
    q['hint'] = this.hint;
    q['points'] = this.points;
    return q;
  }
  String getQuestion(){
    return this.question;
  }

}