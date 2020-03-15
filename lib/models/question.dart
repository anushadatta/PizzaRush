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
  double points;

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

}