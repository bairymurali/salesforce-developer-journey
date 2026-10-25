public with sharing class Day01Variables {
    
    // method to learn about variables in Apex
    public static void practiceVariables() {
        //declare employeeame variable
        String employeeName; 
        employeeName = 'Murali';
        Integer employeeAge;
        employeeAge = 30;
        Decimal basicSalary;
        basicSalary = 50000.00;
        Decimal bonusPercentage;
        bonusPercentage = 10.0;
        Boolean isActive;
        isActive=true;
        Decimal bonus;
        bonus = basicSalary * bonusPercentage / 100;
        Decimal totalSalary;
        totalSalary = basicSalary + bonus;
        Decimal annualSalary = totalSalary * 12;


        System.debug('Employee Name: ' + employeeName);
        System.debug('Emplyee Age: ' + employeeAge);
        System.debug('Basic Salary: ' + basicSalary);
        System.debug('Bonus: ' + bonus);
        System.debug('Total Salary: ' + totalSalary);
        System.debug('Is Active: ' + isActive);
        System.debug('annualSalary: ' + annualSalary);
    }


public static void calculateSalary() {

    String employeeName = 'Murali';
    Decimal basicSalary = 50000;
    Decimal bonusPercentage = 10.0;

    // Challenge 1: Calculate monthly bonus
    Decimal monthlyBonus = basicSalary * bonusPercentage / 100;

    // Challenge 2: Calculate total monthly salary
    Decimal monthlySalary = basicSalary + monthlyBonus;

    // Challenge 3: Calculate annual salary
    Decimal annualSalary = monthlySalary * 12;

    // Challenge 4: Check incentive eligibility
    Decimal incentive;
    if (annualSalary > 600000) {
        incentive =  20000;
    } else {
        incentive = 0;
    }
    // Challenge 5: Calculate final annual compensation
    Decimal finalAnnualSalary = annualSalary + incentive;

    System.debug('Employee: ' + employeeName);
    System.debug('Monthly Bonus: ' + monthlyBonus);
    System.debug('Monthly Salary: ' + monthlySalary);
    System.debug('Annual Salary: ' + annualSalary);
    System.debug('Incentive: ' + incentive);
    System.debug('Final Annual Salary: ' + finalAnnualSalary);
}

    public static void calculatePerformanceBonus() {

        Decimal basicSalary = 50000;
        Integer performanceRating = 3;
        Decimal bonus;

        if(performanceRating < 1 || performanceRating > 5){
            System.debug('Invalid performance rating');
            return;
        }

        // Write your if-else-if logic here
        if(performanceRating == 5) {
            bonus = basicSalary * 0.20;
        }else if(performanceRating == 4){
            bonus = basicSalary * 0.15;
        }else if(performanceRating == 3){
            bonus = basicSalary * 0.10;
        }else {
            bonus = 0;
        }


        System.debug('Performance Rating: ' + performanceRating);
        System.debug('Bonus Amount: ' + bonus);
    }
}
