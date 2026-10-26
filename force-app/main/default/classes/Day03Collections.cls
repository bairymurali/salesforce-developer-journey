public with sharing class Day03Collections {

    /**
        Lists
    */
    public static void listBasics(){
        List<String> employeeNames = new List<String>();

        employeeNames.add('Rahul');
        employeeNames.add('Priya');
        employeeNames.add('Amit');

        System.debug(employeeNames);
    }

    public static void practiceEmployeeList(){
        List<String> employeeNames;
        employeeNames = new List<String>();

        //add employees to the list
        employeeNames.add('Rahul');
        employeeNames.add('Priya');
        employeeNames.add('Amit');
        employeeNames.add('Sneha');

        // print all employees
        System.debug('List of employees: '+employeeNames);

        // print number of employees
        System.debug('Number of employees: ' + employeeNames.size());

        // print second employee in the list
        System.debug('Second employee in the list: ' + employeeNames.get(1));

        //gets List index out of bounds exception
        //System.debug('Second employee in the list: ' + employeeNames.get(4));
    }

    public static void practiceEmployeeLoop(){
        List<String> employeeNames;
        employeeNames = new List<String>();

        //add employees to the list
        employeeNames.add('Rahul');
        employeeNames.add('Priya');
        employeeNames.add('Amit');
        employeeNames.add('Sneha');

        System.debug('List of employees: ');

        //use enhanced for loop to print each employee individually
        for(String employee : employeeNames){
            System.debug(employee);
            if(employee == 'Amit'){
                System.debug('Amit is a Salesforce Developer');
            }
        }
    }

    public static void pd1CertificationCheck1(){
        List<Integer> numbers = new List<Integer>{10, 20, 30};

        // Found is printed only once
        for(Integer num :numbers){
            if(num == 20){
                System.debug('Found');
            }
        }
    }

    /**
        Sets
    */

    public static void practiceDepartmentSet(){
        Set<String> departments;
        departments = new Set<String>();

        departments.add('Sales');
        departments.add('Finance');
        departments.add('Sales');
        departments.add('Support');
        departments.add('IT');

        System.debug('Unique number of departments: ' + departments.size());
        System.debug('Departments: ');
        for(String department : departments){
            System.debug(department);
        }
    }

    public static void practiceDepartmentOperations(){
        
        // Declare a set of strings to hold department names
        Set<String> departments;
        departments = new Set<String>();

        // Add department names to the set
        departments.add('Sales');
        departments.add('Finance');
        departments.add('Sales');
        departments.add('Support');
        departments.add('IT');

        // Check if 'Finance' department exists in the set
        if(departments.contains('Finance')){
            System.debug('Finance department exists');
        } else {
            System.debug('Finance department does not exist');
        }

        // 
        if(departments.remove('Support')){
            System.debug('Support department removed');
        } else {
            System.debug('Support department does not exist');
        }

        // Print the remaining number of departments and their names
        System.debug('Remaining number of departments: ' +  departments.size());

        // Print the remaining departments
        System.debug('Remaining Departments: ');
        for(String department : departments){
            System.debug(department);
        }
    }
    
    /**
        Maps
     */

     public static void mapBasics(){
        Map<Integer, String> employeeMap = new Map<Integer, String>();

        employeeMap.put(101, 'Rahul');
        employeeMap.put(102, 'Priya');
        employeeMap.put(103, 'Amit');

        System.debug(employeeMap);
        System.debug('Employee with ID 102: ' + employeeMap.get(102));
     }

     public static void practiceEmployeeMap(){

        // Declare a map to hold employee IDs and names
        Map<Integer, String> employeeMap;

        // Initialize the map
        employeeMap = new Map<Integer, String>();

        // Add employee IDs and names to the map
        employeeMap.put(101, 'Rahul');
        employeeMap.put(102, 'Priya');
        employeeMap.put(103, 'Amit');
        employeeMap.put(104, 'Sneha');

        // Print the entire map
        System.debug('Employee Map: ' + employeeMap);
        // Print the total number of employees
        System.debug('Total number of employees: ' + employeeMap.size());
        // Print the name of the employee with ID 103
        System.debug('Employee with ID 103: ' + employeeMap.get(103));

        // Check if an employee with ID 105 exists in the map
        if(employeeMap.containsKey(105)){
            System.debug('Employee with ID 105 exists');
        } else {
            System.debug('Employee with ID 105 does not exist');
        }
     }

     public static void practiceEmployeeMapLoop(){
         // Declare a map to hold employee IDs and names
        Map<Integer, String> employeeMap;

        // Initialize the map
        employeeMap = new Map<Integer, String>();

        // Add employee IDs and names to the map
        employeeMap.put(101, 'Rahul');
        employeeMap.put(102, 'Priya');
        employeeMap.put(103, 'Amit');
        employeeMap.put(104, 'Sneha');

        // Loop through the map and print each employee's ID and name
        System.debug('Employee Details: ');
        for(Integer employeeId:employeeMap.keySet()){

            String employeeName = employeeMap.get(employeeId);
            
            // Print the employee ID and name
            System.debug('Employee ID: ' + employeeId + ', Employee Name: ' + employeeName);
            // Check if the employee ID is 103 and print a special message
            if(employeeId == 103){
                System.debug(employeeName + ' is a Salesforce Developer');
            }
        }
     }

     // Practice with Account Map
     public static void practiceAccountMap(){
        
        // Declare a map to hold Account records with their IDs as keys
        Map<Id, Account>  accountMap;

        // Initialize the map with Account records retrieved from a SOQL query
        accountMap = new Map<Id, Account>([SELECT Id, Name, Industry FROM Account LIMIT 10]);
        
        // Print the total number of accounts retrieved and their details
        System.debug('Total number of accounts retrieved: ' + accountMap.size());

        // Loop through the map and print each account's ID, name, and industry
        System.debug('Account Details: ');
        for(Id accountId : accountMap.keySet()){

            Account acc;
            acc = accountMap.get(accountId);
            // Print the account ID, name, and industry
            System.debug('Account ID: ' + accountId + ', Account Name: ' + acc.Name + ', Industry: ' + acc.Industry);
        }
     }

     // Practice with Contact and Account Collections
     public static void practiceContactAccountCollections(){

        // Retrieve a list of Contact records with non-null Account IDs using a SOQL query
        List<Contact> contacts = [SELECT Id, Name, AccountId FROM Contact WHERE AccountId != null LIMIT 20];

        // Declare a set to hold unique Account IDs associated with the retrieved contacts
        Set<Id> accountIds;
        accountIds = new Set<Id>();

        // Loop through the list of contacts and add their Account IDs to the set
        for(Contact contact : contacts){
            accountIds.add(contact.AccountId);
        }

        // Print the total number of unique Account IDs and their details
        System.debug('Total unique Account IDs: ' + accountIds.size());

        // Declare a map to hold Account records with their IDs as keys
        Map<Id, Account> accountMap;

        // Initialize the map with Account records retrieved from a SOQL query using the unique Account IDs
        accountMap = new Map<Id, Account>([SELECT Id, Name, Industry FROM Account WHERE Id IN : accountIds]);

        // Print the total number of accounts retrieved and their details
        System.debug('Total number of accounts retrieved: ' + accountMap.size());


        /** Below code was replace with the one in the for loop to avoid null pointer exception when account is not found for a contact
        System.debug('Contact Name: ' + contact.Name +
            ', Account Name: ' + accountMap.get(contact.AccountId).Name);
        
        */
        // Loop through the list of contacts and print each contact's name along with their associated account's name
        for(Contact contact : contacts) {
            if(accountMap.containsKey(contact.AccountId)) {
                Account acc;
                acc = accountMap.get(contact.AccountId);

                System.debug('Contact Name: ' + contact.Name +
                    ', Account Name: ' + acc.Name);
                } else {
                    System.debug('Account not found for Contact: ' + contact.Name);
                }
        }
    }

}