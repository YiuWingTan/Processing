class LSystem
{
  String sentence;
  Rule[]rules;
  int generation;
  
  LSystem(String _sentence,Rule[] _rules)
  {
    sentence = _sentence;
    rules = _rules;
    generation = 0;
  }
  
  void generate()
  {
    StringBuffer next  = new StringBuffer();
    for(int i = 0;i<sentence.length();i++)
    {
       char mark = sentence.charAt(i);
       String replace = ""+mark;
       for(int j = 0;j<rules.length;j++)
       {
           char str = rules[j].getA();
           if(str==mark)
           {
               replace = rules[j].getB();
               break;
           }
       }
       next.append(replace);
    }
    sentence = next.toString();
  }
  
  String getSentence()
  {
    return sentence;
  }
  
  int getGeneration()
  {
    return generation;
  }
}