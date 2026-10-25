public with sharing class Day01Variables {
    
    // method to learn about variables in Apex
    public static void practiceVariables() {
        //declare employeeame variable
        String employeeName; 
        employeeName = 'Murali';
        Integer employeeAge;
        employeeAge = 30;
        Decimal basicSalary;
        basicSalary = 10000.00;
        Decimal bonusPercentage;
        bonusPercentage = 10.0;
        Boolean isActive;
        isActive=true;
        Decimal bonus;
        bonus = basicSalary * bonusPercentage / 100;
        Decimal totalSalary;
        totalSalary = basicSalary + bonus;

        System.debug('Employee Name: ' + employeeName);
        System.debug('Emplyee Age: ' + employeeAge);
        System.debug('Basic Salary: ' + basicSalary);
        System.debug('Bonus: ' + bonus);
        System.debug('Total Salary: ' + totalSalary);
        System.debug('Is Active: ' + isActive);
    }
}