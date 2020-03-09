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
int longestStreak(List<Map> days){
  days.sort((a, b) => a['date'].compareTo(b['date']));
  print(days);
  int longestStreak=1;
  int temp=1;
  for(int i=0;i<days.length-1;i++){
    if(differenceBetweenDays(days[i]['date'], days[i+1]['date'])==1){
      temp++;
    }else{
      if(longestStreak<temp){
        longestStreak=temp;
      }
       temp=0;
    }
  }
  return longestStreak;
}

int differenceBetweenDays(String day1, String day2){
  return DateTime.parse(day2).difference(DateTime.parse(day1)).inDays;
}
void main() {
  print( longestStreak([
    {
      "date": "2019-09-18"
    },
    {
      "date": "2019-09-19"
    },
    {
      "date": "2019-09-26"
    },
    {
      "date": "2019-09-27"
    },
    {
      "date": "2019-09-30"
    },
    {
      "date": "2019-09-20"
    },
  ]));
}
