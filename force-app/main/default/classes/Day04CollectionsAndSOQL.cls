public with sharing class Day04CollectionsAndSOQL {

    /**
     * Business requirement:
     * Your Salesforce manager wants to identify all Accounts belonging to the Technology industry.
     */
    public static void getTechnologyAccounts(){

        // Query to retrieve technology accounts
        List<Account> technologyAccounts = [SELECT Id, Name, Industry FROM Account WHERE Industry = 'Technology' LIMIT 50];
        
        // Print the total number of technology accounts retrieved
        System.debug('Total number of technology accounts retrieved: ' + technologyAccounts.size());

        // Create a set to hold unique technology account IDs
        Set<Id> technologyAccountIds = new Set<Id>();

        // Loop through the list of technology accounts and add their IDs to the set
        for(Account technologyAccount: technologyAccounts){
            technologyAccountIds.add(technologyAccount.Id);
        }

        // Print the total number of unique technology account IDs
        System.debug('Total number of unique technology account IDs: ' + technologyAccountIds.size());

        // Create a map to hold technology accounts with their IDs as keys

        /**
         * Improvement: 
         * In below Map no need to use the Select query and you can use the already decalared list of technologyAccounts to create the map.
         * Map<Id, Account> technologyAccountMap = new Map<Id, Account>(technologyAccounts);
         */
        //Map<Id, Account> technologyAccountMap = new Map<Id, Account>([SELECT Id, Name, Industry FROM Account WHERE Id IN : technologyAccountIds]);
        Map<Id, Account> technologyAccountMap = new Map<Id, Account>(technologyAccounts);
        
        // Print the total number of technology accounts in the map
        System.debug('Total number of technology accounts in the map: ' + technologyAccountMap.size());

        // Loop through the map and print each technology account's ID, name, and industry
        System.debug('Technology Account Details: ');
        for(Id accountId : technologyAccountMap.keySet()){
            Account acc = technologyAccountMap.get(accountId);
            System.debug('Technology Account ID: ' + accountId + ', Name: ' + acc.Name + ', Industry: ' + acc.Industry);
        }    
    }

    // Challenge: Group Contacts by Account

    /**
     * Output:
     * 
     * 08:20:04.68 (68586223)|CODE_UNIT_STARTED|[EXTERNAL]|execute_anonymous_apex
08:20:04.68 (103000744)|USER_DEBUG|[52]|DEBUG|Total number of contacts retrieved: 21
08:20:04.68 (103910663)|USER_DEBUG|[62]|DEBUG|Contacts grouped by Account: 
08:20:04.68 (104094052)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpVyQAJ
08:20:04.68 (104226351)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00JQAS, Name: Rose Gonzalez
08:20:04.68 (104255580)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00KQAS, Name: Sean Forbes
08:20:04.68 (104304546)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpVzQAJ
08:20:04.68 (104346093)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00LQAS, Name: Jack Rogers
08:20:04.68 (104377168)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpW0QAJ
08:20:04.68 (104412262)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00MQAS, Name: Pat Stumuller
08:20:04.68 (104442002)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpW1QAJ
08:20:04.68 (104484852)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00NQAS, Name: Andy Young
08:20:04.68 (104515895)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpW2QAJ
08:20:04.68 (104550795)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00OQAS, Name: Tim Barr
08:20:04.68 (104575454)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00PQAS, Name: John Bond
08:20:04.68 (104604739)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpW3QAJ
08:20:04.68 (104639261)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00QQAS, Name: Stella Pavlova
08:20:04.68 (104663438)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00RQAS, Name: Lauren Boyle
08:20:04.68 (104687647)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00VQAS, Name: Arthur Song
08:20:04.68 (104712138)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00aQAC, Name: Avi Green
08:20:04.68 (104741526)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpW4QAJ
08:20:04.68 (104776167)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00SQAS, Name: Babara Levy
08:20:04.68 (104800890)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00TQAS, Name: Josh Davis
08:20:04.68 (104831326)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpW5QAJ
08:20:04.68 (104866901)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00UQAS, Name: Jane Grey
08:20:04.68 (104897460)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpW6QAJ
08:20:04.68 (104932216)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00WQAS, Name: Ashley James
08:20:04.68 (104961276)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpW7QAJ
08:20:04.68 (104996434)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00XQAS, Name: Tom Ripley
08:20:04.68 (105029435)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00YQAS, Name: Liz D'Cruz
08:20:04.68 (105063438)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpW8QAJ
08:20:04.68 (105099306)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00ZQAS, Name: Edna Frank
08:20:04.68 (105129009)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001FhpW9QAJ
08:20:04.68 (105164007)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00bQAC, Name: Siddartha Nedaerk
08:20:04.68 (105189646)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000uV00cQAC, Name: Jake Llorrac
08:20:04.68 (105219278)|USER_DEBUG|[64]|DEBUG|Account ID: 001gK00001GFtYkQAL
08:20:04.68 (105254077)|USER_DEBUG|[66]|DEBUG| - Contact ID: 003gK00000up1wIQAQ, Name: Robert Schramm
     */

     /*
    public static void groupContactsByAccount() {

        // Query to retrieve contacts with non-null AccountId
        List<Contact> contacts = [SELECT Id, Name, AccountId FROM Contact WHERE AccountId != null LIMIT 50];

        // Print the total number of contacts retrieved
        Integer totalContacts = contacts.size();

        // Create a map to group contacts by their AccountId
        System.debug('Total number of contacts retrieved: ' + totalContacts);

        //  Create a map to group contacts by their AccountId
        Map<Id, List<Contact>> contactsByAccount = new Map<Id, List<Contact>>();

        // Loop through the list of contacts and group them by AccountId
        for(Contact contact : contacts){

            // Check if the AccountId already exists in the map, if not, initialize a new list for that AccountId
            if(!contactsByAccount.containsKey(contact.AccountId)){
                // Initialize a new list for the AccountId if it doesn't exist in the map
                contactsByAccount.put(contact.AccountId, new List<Contact>());
            }

            // Add the contact to the list for the corresponding AccountId
            contactsByAccount.get(contact.AccountId).add(contact);
        }

        // Print the grouped contacts by AccountId
        System.debug('Contacts grouped by Account: ');

        // Loop through the map and print each AccountId along with its associated contacts
        for(Id accountId : contactsByAccount.keySet()){

            // Print the AccountId and the associated contacts
            System.debug('Account ID: ' + accountId);

            // Loop through the list of contacts for the current AccountId and print their details
            for(Contact contact : contactsByAccount.get(accountId)){
                System.debug(' - Contact ID: ' + contact.Id + ', Name: ' + contact.Name);
            }
            Integer totalContactsForAccount = contactsByAccount.get(accountId).size();
            System.debug('Total number of contacts for Account ID ' + accountId + ': ' + totalContactsForAccount);
        }
    }*/

    // Challenge: Group Contacts by Account
    // Output: Account ID: 001XXXX001, Total Contacts: 2

    public static void groupContactsByAccount() {

        // Query to retrieve contacts with non-null AccountId
        List<Contact> contacts = [SELECT Id, Name, AccountId FROM Contact WHERE AccountId != null LIMIT 50];

        // Print the total number of contacts retrieved
        Integer totalContacts = contacts.size();
        System.debug('Total number of contacts retrieved: ' + totalContacts);       

        // Create a map with AccountId as key and Integer to hold the count of contacts for that account
        Map<Id, Integer> contactsCountByAccount = new Map<Id, Integer>();

        // Loop through the list of contacts and count them by AccountId
        for(Contact contact : contacts){
            // Check if the AccountId already exists in the map, if not, initialize the count
            if(contactsCountByAccount.containsKey(contact.AccountId)){
                Integer count = contactsCountByAccount.get(contact.AccountId);
                contactsCountByAccount.put(contact.AccountId, count + 1);
            } else {
                contactsCountByAccount.put(contact.AccountId, 1);
            }
        }

        // Print the grouped contacts count by AccountId
        System.debug('Contacts grouped by Account: ');
        // Loop through the map and print each AccountId along with its associated contact count
        for(Id accountId : contactsCountByAccount.keySet()){
            // Print the AccountId and the associated contact count
            System.debug('Account ID: ' + accountId + ', Total Contacts: ' + contactsCountByAccount.get(accountId));
        }  
    }

    /**
     * Apex Exercise 3 — SOQL Aggregate Queries
     * 
     * Now let's learn how to solve the same business requirement more efficiently using SOQL aggregation.
     * Instead of retrieving individual Contacts and counting them in Apex, Salesforce can calculate the counts directly using COUNT() and GROUP BY.
     * 
     * SELECT AccountId, COUNT(Id) totalContacts
     * FROM Contact
     * WHERE AccountId != null
     * GROUP BY AccountId
     * 
     * This query returns grouped results rather than individual Contact records.
     * 
     * 
     * Requirements:
     * 1. Use the aggregate SOQL query shown above.
     * 2. Store the results in a List<AggregateResult>.
     * 3. Loop through each AggregateResult.
     * 4. Extract the Account ID using get('AccountId').
     * 5. Extract the Contact count using get('totalContacts').
6. Print the Account ID and Contact count.
     * 
     */

    public static void countContactsUsingAggregate() {
        // Query to retrieve the count of contacts grouped by AccountId using SOQL aggregation
        List<AggregateResult> contactCounts = [SELECT AccountId, COUNT(Id) totalContacts FROM Contact WHERE AccountId != null GROUP BY AccountId];

        // Print the total number of unique accounts with contacts
        System.debug('Total number of unique accounts with contacts: ' + contactCounts.size());

        // Loop through the list of aggregate results and print each AccountId along with its associated contact count
        for(AggregateResult result : contactCounts){
            Id accountId = (Id)result.get('AccountId');
            Integer totalContacts = (Integer)result.get('totalContacts');
            System.debug('Account ID: ' + accountId + ', Total Contacts: ' + totalContacts);
        }
    }
}