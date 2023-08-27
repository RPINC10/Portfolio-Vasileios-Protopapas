# I declare that my work contains no examples of misconduct, such as plagiarism, or collusion.
# Any code taken from other sources is referenced within  my code solution.
# Student ID: W1735144
# Date: 17/11/19
#Variable for range checking
num=(0,20,40,60,80,100,120)
print("*********Welcome to the University prediction progression program************")
print("Staff Member version")
#Definition for exiting the programe         
def exiting():
    while True:
        exiting=input("Press q to quit and any other button to continue")
        if exiting=="q":
            #shows the histogram for all outcomes
            a='*'
            x = 'Progress Trailling Module Exclude'
            for i in x:
                i.lower()
            print(x) 
            for n in range(progress):
                print(f'{a:>4}')
            for n in range(prog):
                print(f'{a:>14}')
            for n in range(module):
                print(f'{a:>22}')
            for n in range(exclude):
                print(f'{a:>30}')

            print() 
            print("You have entered",entries,"outcomes")
            exit()
        return exiting
   
#variables for counting all outcomes     
entries=0
exclude=0
progress=0
prog=0
module=0
while (entries<=20):
            um=print('Enter mark for module number ' + str(entries + 1))
            print('')
            #pass grade
            pass_g=input("Enter your pass grade: ")
            #integer check for pass grade
            try:
                pass_g=int(pass_g)
            except ValueError:
                print("Not a valid integer")
            #Range check for pass grade
            if pass_g not in num:
                print("The number is outside the given range of: 0,20,40,60,80,100,120")
                exit()
                #Ends the program
            #defer grade
            defer_g=input("Enter your defer grade: ")
            #integer check for defer grade
            try:
                defer_g=int(defer_g)
            except ValueError:
                print("Not a valid integer")
            #Range check for defer grade
            if defer_g not in num:
                print("The number is outside the given range of: 0,20,40,60,80,100,120")
                exit()
            #fail grade 
            fail_g=input("Enter your fail grade: ")
            #integer check for fail grade
            try:
                fail_g=int(fail_g)
            except ValueError:
                print("Not a valid integer")
            #Range check for fail grade
            if fail_g not in num:
                print("The number is outside the given range of: 0,20,40,60,80,100,120")
                exit()
            print('')
            #Variable used for checking that the grade is not over 120
            overall_g=pass_g+defer_g+fail_g
            #entries counted 
            entries+=1

            #This will check if the fail grade is more than or equal to 80 and 120 so that it will show exclude
            if (fail_g>=80 and fail_g<=120):
                    print("Exclude")
                    exclude+=1
                    exiting()
                    
            #This will check if the pass grade is equal to 120 so that it will show progress    
            if pass_g == 120:
                    print("Progress")
                    progress+=1
                    exiting()

            #Used for checking that the grade is not over 120      
            if overall_g!=120:
                print("Total incorrect")
                exit()

            #This will show that if the pass grade is equal to 100 then it will output progress-module trailer
            if pass_g==100:
                print("Progress-module trailer")
                prog+=1
                exiting()

            #This will show that if the pass grade is less than or equal to 80 and more than 20, defer and fail grade less than 20 and fail grade less than 80 then it will output Do not Progress –module retrieve 
            if (pass_g<=80 and pass_g>20 and defer_g or fail_g>20 and fail_g<80):
                print("Do not Progress –module retrieve")
                module+=1
                exiting()


                
