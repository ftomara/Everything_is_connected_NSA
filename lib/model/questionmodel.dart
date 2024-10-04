class Questionmodel 
{
  String question = '';
  String hint = '';
  late final int rightindx ;
  List<String> answers = [];
  bool haslink = true;
  Questionmodel(this.question, this.answers , this.rightindx , this.hint , {this.haslink = true});

}