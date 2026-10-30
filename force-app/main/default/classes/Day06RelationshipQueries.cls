public with sharing class Day06RelationshipQueries {

/**
 * Retrieves Contact records along with their related parent Account details
 * using a child-to-parent SOQL relationship query.
 */
    public static void childToParentRelationshipQuery(){

        // Retrieve up to 10 Contacts that are associated with an Account.
        // Use dot notation (Account.Name, Account.Industry) to access
        // fields from the parent Account object.
        List<Contact> contacts = [
            SELECT Id, Name, Account.Name, Account.Industry
            FROM Contact
            WHERE AccountId != null
            LIMIT 10
        ];

        // Iterate through the retrieved Cont ̰act records.
        for(Contact contact : contacts){

            // Print the Contact's name.
            System.debug('Contact: ' + contact.Name);

            // Print the name of the parent Account associated with the Contact.
            System.debug('Account: ' + contact.Account.Name);

            // Print the industry of the parent Account.
            System.debug('Industry: ' + contact.Account.Industry);
        }
    }

    /**
 * Retrieves Account records along with their related child Contact records
 * using a parent-to-child SOQL relationship query.
 */
    public static void parentToChildRelationshipQuery(){

        // Retrieve up to 10 Account records along with their related Contacts.
        // The nested SOQL query uses the child relationship name 'Contacts'
        // to retrieve Contact Id, Name, and Email for each Account.
        List<Account> accounts = [
            SELECT Id, Name,
                (SELECT Id, Name, Email FROM Contacts)
            FROM Account
            LIMIT 10
        ];

        // Iterate through the retrieved parent Account records.
        for(Account account : accounts){

            // Print the name of the current parent Account.
            System.debug('Account: ' + account.Name);

            // Iterate through the child Contacts associated with the current Account.
            for(Contact contact : account.Contacts){

                // Print the name of each related Contact.
                System.debug('Contact: ' + contact.Name);
            }
        }
    }

    /**
    Requirements:
    1. Query up to 20 Contacts whose AccountId is not null.
    2. Retrieve Contact Id, Name, Email, and parent Account Name and Industry.
    3. Store the results in List<Contact>.
    4. Print the total number of Contacts retrieved.
    5. Loop through the Contacts and print their names, emails, Account names, and Account industries. 
    */

    /**
 * Retrieves Contact records along with their parent Account details
 * using a child-to-parent SOQL relationship query.
 */
    public static void getContactsWithAccountDetails(){

        // Retrieve up to 20 Contacts associated with an Account.
        // Use relationship dot notation to retrieve parent Account fields.
        List<Contact> contacts = [
            SELECT Id, Name, Email, Account.Name, Account.Industry
            FROM Contact
            WHERE AccountId != null
            LIMIT 20
        ];

        // Print the total number of Contacts retrieved.
        System.debug('Total number of contacts retrieved: ' + contacts.size());

        // Iterate through each Contact record.
        for(Contact contact : contacts){

            // Print Contact details.
            System.debug('Contact Name: ' + contact.Name);
            System.debug('Contact Email: ' + contact.Email);

            // Print the related parent Account details.
            System.debug('Account Name: ' + contact.Account.Name);
            System.debug('Account Industry: ' + contact.Account.Industry);
        }
    }

    /**
    Quick interview question
    Why do we use contact.Account.Name instead of Account.Name inside the for loop?
    
    A:
    We use contact.Account.Name because contact represents the current Contact record in the loop, Account represents its related parent Account record, and Name retrieves that Account's name.

    Account.Name by itself doesn't identify the parent Account of the current Contact in Apex code.
    */

    /**
        Retrieve up to 10 Account records using SOQL.
        Retrieve each Account's Id and Name.
        Use a parent-to-child subquery to retrieve related Contacts with Id, Name, and Email.
        Store the results in List<Account>.
        Print the total number of Accounts retrieved.
        Loop through the Accounts and print each Account's name.
        Inside the Account loop, use another for loop to print each related Contact's name and email.
        Print the total number of Contacts associated with each Account.
    */
    /**
 * Retrieves Account records along with their related Contacts
 * using a parent-to-child SOQL relationship query.
 */
    public static void getAccountsWithContactDetails(){

        // Retrieve up to 10 Accounts and their related Contacts.
        // The nested SOQL query retrieves child Contact details.
        List<Account> accounts = [
            SELECT Id, Name,
                (SELECT Id, Name, Email FROM Contacts)
            FROM Account
            LIMIT 10
        ];

        // Print the total number of Accounts retrieved.
        System.debug('Total number of accounts retrieved: ' + accounts.size());

        // Iterate through each parent Account record.
        for(Account account : accounts){

            // Print the current Account's name.
            System.debug('Account Name: ' + account.Name);

            // Print the number of Contacts associated with this Account.
            System.debug('Total Contacts: ' + account.Contacts.size());

            // Iterate through the related child Contact records.
            for(Contact contact : account.Contacts){

                // Print each Contact's name and email.
                System.debug('Contact Name: ' + contact.Name);
                System.debug('Contact Email: ' + contact.Email);
            }
        }
    }
}