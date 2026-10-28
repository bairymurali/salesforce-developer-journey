public with sharing class Day05Relationships {

    public static void getContactsWithAccounts(){

        List<Contact> contacts = [SELECT Id, Name, AccountId, Account.Name, Account.Industry FROM Contact WHERE AccountId != null LIMIT 20];

        for(Contact contact : contacts){
            System.debug('Contact Name: ' + contact.Name);
            System.debug('Account: ' + contact.Account.Name);
            System.debug('Industry: ' + contact.Account.Industry);
        }
    }

    /**
     * Business Requirement:
     * getAccountsWithContacts() — retrieve Accounts and their related Contacts using a parent-to-child subquery.
     *
     * Requirements:
        1. Retrieve up to 10 Account records.
        2. Retrieve each Account's related Contacts using a SOQL subquery.
        3. Print each Account's Name and Industry.
        4. Print the Name and Email of each related Contact.
        5. Use nested for loops.

     */

     public static void getAccountsWithContacts(){

        // Query to retrieve Accounts and their related Contacts
        List<Account> accounts = [SELECT Id, Name, Industry, (SELECT Id, Name, Email FROM Contacts) FROM Account LIMIT 10];

        // Print the number of Accounts retrieved
        System.debug('Number of Accounts retrieved: ' + accounts.size());

        // Loop through each Account and print its details along with its related Contacts
        for(Account account : accounts){
            System.debug('Account Name: ' + account.Name);
            System.debug('Account Industry: ' + account.Industry);

            // Loop through each related Contact and print its details
            for(Contact contact : account.Contacts){
                System.debug('Contact Name: ' + contact.Name);
                System.debug('Contact Email: ' + contact.Email);
            }
        }
     }

     /**
      * Topic: Count Contacts per Account using a relationship query

        Your method should:
        1. Retrieve up to 10 Accounts and their related Contacts using a parent-to-child SOQL query.
        2. Print each Account's Name.
        3. Calculate the number of related Contacts using .size().
        4. Print the Contact count for each Account.
        5. Print the total number of Contacts across all retrieved Accounts.
      */


    public static void countContactsPerAccount(){

        // Retrieve Accounts and their related Contacts
        List<Account> accounts = [
            SELECT Id, Name,
                   (SELECT Id FROM Contacts)
            FROM Account
            LIMIT 10
        ];

        // Initialize variables
        Integer totalContacts = 0;
        Integer accountContactCount = 0;

        // Process each Account
        for(Account account : accounts){

            System.debug('Account Name: ' + account.Name);

            // Count Contacts for current Account
            accountContactCount = account.Contacts.size();

            System.debug('Contact Count: ' + accountContactCount);

            // Accumulate grand total
            totalContacts += accountContactCount;
        }

        // Print final totals
        System.debug('Total Accounts: ' + accounts.size());
        System.debug('Total Contacts Across Accounts: ' + totalContacts);
    }

    /**
     *
     * Topic: Find Accounts with More Than Two Contacts
     * Concepts: Parent-to-child SOQL, Lists, loops, conditional statements, and counting
     *
     * Business requirement
        Your Salesforce manager wants to identify Accounts that have more than 2 related Contacts.

        You need to develop an Apex method that retrieves Accounts, checks their Contact counts, and displays only those Accounts that satisfy the requirement.
     */

     public static void findAccountsWithMultipleContacts(){

        // Retrieve Accounts and their related Contacts
        List<Account> accounts = [SELECT Id, Name, (SELECT Id FROM Contacts) FROM Account LIMIT 10];

        // Initialize a counter for Accounts meeting the criteria
        Integer totalAccountsMeetingCriteria = 0;
        List<Account> qualifyingAccounts = new List<Account>();

        // Loop through each Account and check the number of related Contacts
        for(Account account : accounts){

            // Count the number of related Contacts for the current Account
            Integer relatedContactCount = account.Contacts.size();

            // Check if the Account has more than 2 related Contacts
            if(relatedContactCount > 2) {
                System.debug('Account Name: ' + account.Name);
                System.debug('Contact Count for current Account: ' + relatedContactCount);
                totalAccountsMeetingCriteria++;
                qualifyingAccounts.add(account);
            }
        }

        // Print the total number of Accounts that meet the criteria
        System.debug('Total Accounts with more than 2 Contacts: ' + totalAccountsMeetingCriteria);
        System.debug('List of Accounts with more than 2 Contacts: ' + qualifyingAccounts);
        System.debug('Total Accounts Retrieved: ' + accounts.size());
        System.debug('Total qualified Accounts: ' + qualifyingAccounts.size());
     }
}