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
//  print(longestStreak([
//        {"date": "2019-09-18"},
//        {"date": "2019-09-19"},
//        {"date": "2019-09-26"},
//        {"date": "2019-09-27"},
//        {"date": "2019-09-30"},
//        {"date": "2019-09-20"},
//      ]) ==
//      3);
//  print(longestStreak([
//        {"date": "2019-09-18"},
//        {"date": "2019-09-19"},
//      ]) ==
//      2);
//  print(longestStreak([
//        {"date": "2019-09-18"},
//      ]) ==
//      1);
//  print(longestStreak([
//        {"date": "2019-09-18"},
//        {"date": "2019-10-19"},
//      ]) ==
//      1);
  print("test 1");
  print(originalString(['quick', 'brown', 'the', 'fox'], "thequickbrownfox"));
  print(originalStringWithoutRecur(['quick', 'brown', 'the', 'fox'], "thequickbrownfox"));
  print("------------");
  print("test 2");
  print(originalString(
      ['bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalStringWithoutRecur(
      ['bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("------------");
  print("test 3");
  print(originalString(['bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print(originalStringWithoutRecur(['bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print("------------");
  print("test 4");
  print(originalString(['bedbath', 'bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print(originalStringWithoutRecur(['bedbath', 'bed', 'bath', 'bedbath', 'and', 'beyond'],
      "bedbathandbeyondeverything"));
  print("------------");
  print("test 5");
  print(originalString(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'],
      'thatfoxisthequickbrownfox'));
  print(originalStringWithoutRecur(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'],
      'thatfoxisthequickbrownfox'));
  print("------------");
  print("test 6");
  print(originalString(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], 'fox'));
  print(originalStringWithoutRecur(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], 'fox'));
  print("------------");
  print("test 7");
  print(originalString(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], ''));
  print(originalStringWithoutRecur(
      ['quick', 'brown', 'the', 'fox', 'quickbrown', 'that', 'is'], ''));
  print("------------");
  print("test 8");
  print(originalString(
      ['bedb', 'bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalStringWithoutRecur(
      ['bedb', 'bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("------------");
  print("test 9");
  print(originalString(
      ['bedb','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalStringWithoutRecur(
      ['bedb','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("test 10");
  print(originalString(
      ['be','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalStringWithoutRecur(
      ['be','bed', 'bath', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print("test 11");
  print(originalString(
      ['bed', 'bat', 'bedbath', 'and', 'beyond'], "bedbathandbeyond"));
  print(originalStringWithoutRecur(
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

List<String> originalStringWithoutRecur(List<String> dictionary,String str){

  List<List> storage=[];
  for(int i=0;i<dictionary.length;i++){
    String selectedWord=dictionary[i];
    if(wordStartsWith(str, selectedWord)){
      storage.add([[selectedWord],str.substring(selectedWord.length)]);
    }
  }
//  print(storage);
  while(storage.isNotEmpty){
    var currentSelection=storage.removeLast();
    List<String> listOfMatches= currentSelection[0];
    String remainingString = currentSelection[1];
    if(remainingString.isEmpty)
      return listOfMatches;
    for(int i=0;i<dictionary.length;i++){
      String selectedWord=dictionary[i];
//      print("remS is $remainingString and seletWord is $selectedWord");
      if(wordStartsWith(remainingString, selectedWord)){
        List<String> temp=[];
        temp.addAll(listOfMatches);
        temp.add(selectedWord);
        String tempSubString=remainingString.substring(selectedWord.length);
        if(tempSubString.isEmpty)
          return temp;
        storage.add([temp,tempSubString]);
      }
    }
//    print("storage is $storage");
  }

  return null;
}


bool wordStartsWith(String word, String str){
  if(str.length>word.length)
    return false;
  return str==word.substring(0,str.length) && str.isNotEmpty;
}