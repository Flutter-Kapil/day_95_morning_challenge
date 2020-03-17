// Challenge 1
// Longest Streak
// Create a function that takes an array of objects with date property and return the
// "longest streak" (i.e. number of consecutive days in a row).
//
// Example
// longestStreak([
//   {
//   "date": "2019-09-18"
//   },
//   {
//   "date": "2019-09-19"
//   },
//   {
//   "date": "2019-09-20"
//   },
//   {
//   "date": "2019-09-26"
//   },
//   {
//   "date": "2019-09-27"
//   },
//   {
//   "date": "2019-09-30"
//   }
// ]) ➞ 3

// Challenge 2
// This problem was asked by Microsoft.
//
// Given a dictionary as a list of words and a string made up of those words (no spaces),
// return the original sentence in a list. If there is more than one possible
// reconstruction, return any of them. If there is no possible reconstruction,
// then return null.
//
// For example, given the set of words 'quick', 'brown', 'the', 'fox', and the
// string "thequickbrownfox", you should return ['the', 'quick', 'brown', 'fox'].
//
// Given the set of words 'bed', 'bath', 'bedbath', 'and', 'beyond', and the
// string "bedbathandbeyond", return either ['bed', 'bath', 'and', 'beyond] or
// ['bedbath', 'and', 'beyond'].
import 'dart:math';

int longestStreak(List<Map> days) {
  if (days.isEmpty) return 0;
  days.sort((a, b) => a['date'].compareTo(b['date']));
//  print(days);
  int longestStreak = 1;
  int temp = 1;
  for (int i = 0; i < days.length - 1; i++) {
    if (differenceBetweenDays(days[i]['date'], days[i + 1]['date']) == 1) {
      temp++;
    } else {
      temp = 0;
    }
    if (longestStreak < temp) {
      longestStreak = temp;
    }
  }
  return longestStreak;
}

int differenceBetweenDays(String day1, String day2) {
  return DateTime.parse(day2).difference(DateTime.parse(day1)).inDays;
}

void main() {
  print(longestStreak([
        {"date": "2019-09-18"},
        {"date": "2019-09-19"},
        {"date": "2019-09-26"},
        {"date": "2019-09-27"},
        {"date": "2019-09-30"},
        {"date": "2019-09-20"},
      ]) ==
      3);
  print(longestStreak([
        {"date": "2019-09-18"},
        {"date": "2019-09-19"},
      ]) ==
      2);
  print(longestStreak([
        {"date": "2019-09-18"},
      ]) ==
      1);
  print(longestStreak([
        {"date": "2019-09-18"},
        {"date": "2019-10-19"},
      ]) ==
      1);
  print("test 1");
  print(originalString(['quick', 'brown', 'the', 'fox'], "thequickbrownfox"));
  print(originalString2(['quick', 'brown', 'the', 'fox'], "thequickbrownfox"));
  print(originalString3(['quick', 'brown', 'the', 'fox'], "thequickbrownfox"));
  print("------------");
  print("test 2");
  print(originalString(
      ['bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalString2(
      ['bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalString3(
      ['bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("------------");
  print("test 3");
  print(originalString(['bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print(originalString2(['bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print(originalString3(['bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print("------------");
  print("test 4");
  print(originalString(['bedbath', 'bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print(originalString2(['bedbath', 'bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print(originalString3(['bedbath', 'bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print("------------");
  print("test 5");
  print(originalString(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'],
      'thatfoxisthequickbrownfox'));
  print(originalString2(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'],
      'thatfoxisthequickbrownfox'));
  print(originalString3(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'],
      'thatfoxisthequickbrownfox'));
  print("------------");
  print("test 6");
  print(originalString(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], 'fox'));
  print(originalString2(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], 'fox'));
//  print(originalString3(
//      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], 'fox'));
  print("------------");
  print("test 7");
  print(originalString(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], ''));
  print(originalString2(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], ''));
  print(originalString3(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], ''));
  print("------------");
  print("test 8");
  print(originalString(
      ['bedb', 'bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
//  print(randomString(100000));
//  print(originalString(['bedb', 'bed', 'bath', 'bedbath', 'and', 'beyond'],
//      multiplString(10000, "bedbathandbeyond")));
  print(originalString2(
      ['bedb', 'bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalString3(
      ['bedb', 'bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("------------");
  print("test 9");
  print(originalString(
      ['bedb','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalString2(
      ['bedb','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalString3(
      ['bedb','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("test 10");
  print(originalString(
      ['be','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalString2(
      ['be','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalString3(
      ['be','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("------------111");
  print(originalString(
      ['bed', 'bat', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalString2(
      ['bed', 'bat', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalString3(
      ['bed', 'bat', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
}

List<String> originalString(List<String> dictionary, String noSpaceString) {
  List<String> res = [];

  if (noSpaceString.length == 0) {
    return null;
  }

  for (int i = 0; i < noSpaceString.length; i++) {
    String currentWord = noSpaceString.substring(0, i + 1);
    int lengthToTrim = currentWord.length;
    if (dictionary.contains(currentWord)) {
      res.add(currentWord);
      noSpaceString = noSpaceString.substring(lengthToTrim);
    }
  }

  if (res.isEmpty) {
    return null;
  } else if (noSpaceString.isEmpty) {
    return res;
  } else {
    List<String> temp = originalString(dictionary, noSpaceString);
    if (temp != null) res.addAll(temp);

    return (temp != null) ? res : temp;
  }
}

String randomString(length) {
  var result = '';
  var characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  var charactersLength = characters.length;
  for (var i = 0; i < length; i++) {
    result += characters[Random().nextInt(26)]; //Random().nextInt(26)
  }
  return result;
}

multiplString(int n, String str) {
  String res = '';
  for (int i = 0; i <= n; i++) {
    res = res + str;
  }
  return res;
}

List<String> originalString2(List<String> dictionary, String noSpaceString) {

  int loops=0;
  List<String> res = [];
  List<String> possibilities=[];
  if (noSpaceString.length == 0) {
    return null;
  }
  mainLoop:
  while (noSpaceString.length != 0) {
    for (int i = 0; i < noSpaceString.length; i++) {
      String currentWord = noSpaceString.substring(0, i + 1);
      int lengthToTrim = currentWord.length;
      if (dictionary.contains(currentWord)) {
        res.add(currentWord);
        possibilities.add(currentWord);
        noSpaceString = noSpaceString.substring(lengthToTrim);
        ///TODO
        continue mainLoop;
      }
//      else if(i==noSpaceString.length-1){
//        //this means there is something remaining and its not present in dictionary as well, so we return null
//        break;
//      }
    }
    break mainLoop;
  }
    if (res.isEmpty) {
//      print(1);
      return null;
    } else if (noSpaceString.isEmpty) {
      print(2);
      return res;
    }
    else if(noSpaceString.isNotEmpty && res.isNotEmpty){
//      print("nospaceString is $noSpaceString and res is $res ");
      print(3);
      //can add another while llop here, which goes through each starting position, and then
      possibilities=possibilities.toSet().toList();
      if(loops<=possibilities.length){
        String temp =possibilities[0];
        dictionary.remove(temp);
        dictionary.add(temp);
        possibilities.removeAt(0);
        possibilities.add(temp);
        print("inside loops");
        loops++;
      }

      return null;
    }
    print(4);

  return res;
}

List<String> originalString3(List<String> dict, String str) {
  print("is str empty ${str.isEmpty} length ${str.length}");
  if(str.isEmpty)
    return null;
  Map<String,String> matchedDictWords={};
  mainForLoop:for(int i=0;i<dict.length;i++){
    String selectedWord=dict[i];
    if(dict.contains(selectedWord)){
      print("selectedword is $selectedWord");
      if(selectedWord==str){
        matchedDictWords[selectedWord]="";
      }else
      matchedDictWords[selectedWord]=str.split(selectedWord)[1];
    }

  }
  if(matchedDictWords.isEmpty)
    return null; //this means none of the dictionary word matched str

  //now lest try to form original string from matched words
  String tempStr='';
  List<String> res=[];
  List<String> allKeys=matchedDictWords.keys.toList();
//  print("matcheddictwords are $matchedDictWords");
  //find key with value that matches tempStr and keep adding it to tempStr
  int totalMatchedWords = matchedDictWords.length;
  for(int j=0;j<totalMatchedWords;j++){
//    print("tempStr is $tempStr and its length is ${tempStr.length}");
    if(matchedDictWords.containsValue(tempStr)){
      String keyFound=allKeys.firstWhere((item)=>matchedDictWords[item]==tempStr);
      tempStr=keyFound+tempStr;
      res.insert(0, keyFound);
      matchedDictWords.remove(keyFound);

    }
    if(res.join("")==str)
      return res;
//    if(matchedDictWords.isNotEmpty)
//      return null;
  }
//  print("matcheddictwords after are $matchedDictWords");
//  print("res value is $res");
  return null;
}
