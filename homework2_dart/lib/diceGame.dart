import 'dart:io';
import 'dart:math';

void main() {
  print('Type exit to quit the game');
  guessingGame();
}

guessingGame() {
  final random = Random();
  int totalComp = 0;
  int totalUser = 0;

  int diceScore() => random.nextInt(6) + 1;

  while (true) {
    stdout.write('If you want to play the game enter "roll" : ');
    String choseAnswer = stdin.readLineSync()!;

    if (choseAnswer.toLowerCase() != 'roll' &&
        choseAnswer.toLowerCase() != 'exit') {
      print('Incorrect! Please enter roll or exit!');
      break;
    }

    // Main logic
    if (choseAnswer.toLowerCase() == 'exit' && totalUser != totalComp) {
      print("Your score: $totalUser Computer: $totalComp");
      print('Bye Bye');
      break;
    } else if (totalUser == totalComp && choseAnswer.toLowerCase() == 'exit') {
      print('Evened the score at: $totalUser:$totalComp');
      break;
    }

    int randomComp = diceScore() + diceScore();
    int randomUser = diceScore() + diceScore();
    if (randomUser > randomComp) {
      ++totalUser;
    }

    if (randomUser < randomComp) {
      ++totalComp;
    }
  }
}
