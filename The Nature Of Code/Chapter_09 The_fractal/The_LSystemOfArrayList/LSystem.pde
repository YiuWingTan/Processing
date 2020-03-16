class LSystem
{
  String sentence;
  Rule[]rules;
  int generation;
  
  LSystem(String s,Rule[]_rules)
  {
    generation = 0;
    sentence = s;
    rules = _rules;
  }
  
  void generate()
  {
    StringBuffer next = new StringBuffer();
    
    for(int i = 0;i<sentence.length();i++)
    {
       char stuff = sentence.charAt(i);
       String replace = ""+stuff;
       
       for(int j = 0;j<rules.length;j++)
       {
          if(stuff==rules[j].getA())
          {
             replace = rules[j].getB();
             break;
          }
       }
       next.append(replace);
    }
    sentence = next.toString();
   // println(sentence);
  }
  
  String genSentence()
  {
    return sentence;
  }
  
  int getGeneration()
  {
     return generation; 
  }
}