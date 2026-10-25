public with sharing class Day02Loops {

    // Basic version of for loop
    public static void practiceForLoop() {
        for(Integer i = 1; i <= 5; i++) {
            System.debug('Number: ' + i);
        }
    }

    // Calculate annual salary using for loop
    public static void calculateAnnualSalaryUsingLoop(){
        Decimal monthlySalary = 50000;
        Decimal totalSalary = 0;

        for(Integer i = 1; i <= 12; i++){
            totalSalary += monthlySalary;
            System.debug('month ' + i + ': ' + totalSalary);
        }

        System.debug('Annual salary: ' + totalSalary);
    }

    // Identify even and odd numbers from 1 to 20 and print count of evens and odds
    public static void identifyEvenOddNumbers() {

        Integer evenCount = 0;
        Integer oddCount = 0;
        Boolean isOdd = false;
        // Loop through 1 to 20
        for(Integer i = 1; i <= 20; i++){
            isOdd = !isOdd;
            if(isOdd){
                oddCount++;
                System.debug(i + ' is Odd');
            } else {
                evenCount++;
                System.debug(i + ' is Even');
            }
        }

        System.debug('Total Even Numbers: '+ evenCount);
        System.debug('Total Odd Numbers: ' + oddCount);
    }

    // Another way of doing even and odd without using Math.mod() method
    public static void identifyEvenOddNumbersAnotherWay() {

        Integer evenCount = 0;
        Integer oddCount = 0;
        Integer counter = 1;
        // Loop through 1 to 100
        for(Integer i = 1; i <= 100; i++){
            if(counter == 2){
                System.debug(i + ' is even');
                evenCount++;
                counter = 1;
            }else {
                System.debug(i + ' is odd');
                oddCount++;
                counter++;
            }
        }

        System.debug('Total Even Numbers: '+ evenCount);
        System.debug('Total Odd Numbers: ' + oddCount);
    }

    // Sum of even and odd between 1 and 100 using for loop
    public static void sumOfEvenAndSumOfOdd() {

        Integer evenCount = 0;
        Integer oddCount = 0;
        Integer sumOfEven = 0;
        Integer sumOfOdd = 0;
        Integer flipCounterEvenToOdd = 1;
        // Loop through 1 to 100
        for(Integer i = 1; i <= 100; i++){
            if(flipCounterEvenToOdd == 2){
                System.debug(i + ' is even');
                evenCount++;
                flipCounterEvenToOdd = 1;
                sumOfEven += i;
            }else {
                System.debug(i + ' is odd');
                oddCount++;
                flipCounterEvenToOdd++;
                sumOfOdd += i;
            }
        }

        System.debug('Total Even Numbers: '+ evenCount);
        System.debug('Total Odd Numbers: ' + oddCount);
        System.debug('Sum of even numbers between 1 and 100: '+ sumOfEven);
        System.debug('Sum of odd numbers between 1 and 100: '+ sumOfOdd);
    }

    // Identify even and odd using Math.mod() method
    public static void identifyEvenOddNumbersUsingMod() {

        Integer evenCount = 0;
        Integer oddCount = 0;
       
        // Loop through 1 to 100
        for(Integer i = 1; i <= 100; i++){
            if(Math.mod(i, 2) == 0){
                System.debug(i + ' is even');
                evenCount++;
            }else {
                System.debug(i + ' is odd');
                oddCount++;
            }
        }

        System.debug('Total Even Numbers: '+ evenCount);
        System.debug('Total Odd Numbers: ' + oddCount);
    }

    // Multiplication table using for loop
    public static void printMultiplicationTable() {

        Integer numberForMultiplication = 7;

        // Write your for loop here
        for(Integer i = 1; i <= 10; i++){
            Integer multiplicationResult = numberForMultiplication * i;
            System.debug(numberForMultiplication + ' x ' + i + ' = ' + multiplicationResult);
        }
    }

    // Basic nested for loop
    public static void basicNestedForLoop(){
        for(Integer i = 1; i <= 3; i++){
            for(Integer j = 1; j <= 2; j++){
                System.debug('i' + ' = ' + i + ', ' + 'j' + ' = ' + j);
            }
        }
    }

    // Print multiplication tables from 1 to 5
    public static void printMultipleTables(){
        for(Integer i = 1; i <= 5; i++){
            Integer numberForMultiplication = i;
            for(Integer j = 1; j <= 10; j++){
                Integer multiplicationResult = i * j;
                System.debug(numberForMultiplication + ' x ' + j + ' = ' + multiplicationResult);
            }
            System.debug('............');
        }
    }

    // Basic while loop
    public static void basicWhileLoop(){
        Integer i = 1;

        while (i <= 5) {
            System.debug('Number: ' + i);
            i++;
        }
    }

    // Calculate monhtly savings of an employee using while loop
    public static void calculateSavingsGoal() {

        Integer monthlySavings = 5000;
        Integer savingsGoal = 50000;
        Integer totalSavings = 0;
        Integer months = 0;

        // loop until the savingsGoal is reached
        while (totalSavings < savingsGoal) {
            months++;
            totalSavings += monthlySavings;

            System.debug('Month ' + months + ': Savings = ' + totalSavings);
        }

        System.debug('Savings Goal Achieved!');
        System.debug('Total Months Required: ' + months);
    }

    // Basic Do While Loop
    public static void basicDoWhileLoop(){
        Integer numberToLoop = 1;

        do {
            System.debug('Number: ' + numberToLoop);
            numberToLoop++;
        } while (numberToLoop <= 5);
    }

    // Simulate ATM Withdrawals using do while loop
    public static void simulateATMWithdrawals(){
        Integer accountBalance = 9000;
        Integer withdrawalAmount = 3000;
        Integer withdrawalCount = 0;

        do{
            if (accountBalance < withdrawalAmount) {
                System.debug('Insufficient Balance!');
                break;
            }
            withdrawalCount++;
            accountBalance -= withdrawalAmount;
            System.debug('Withdrawal ' + withdrawalCount + ': Remaining Balance = ' + accountBalance);
        }while(accountBalance >= withdrawalAmount);

        System.debug('Total Successful Withdrawals: ' + withdrawalCount);
        System.debug('Final Account Balance: '+ accountBalance);
    }
}