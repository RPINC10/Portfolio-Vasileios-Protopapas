import random
import os       
score=0


while True:
    num1 = random.randrange(1, 11)
    num2 = random.randrange(1, 11)
    correctAnswer = num1 + num2

    question = 'What is:  ' + str(num1) + ' + ' + str(num2) + '?  '
    userAnswer = input(question)
    f = open('gamefile.txt', 'r')
    lines = f.readlines()
    print(lines)
    if userAnswer=='':
        break

    userAnswer = int(userAnswer)

    if userAnswer == correctAnswer:
        print('Yes, you got it!')
        score=score+2
    else:
        print('No, sorry, the correct answer was:  ', correctAnswer)
        score=score-1

    print( 'Your current score is: ', score)
    print()

print('Thanks for playing')

