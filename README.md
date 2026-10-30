# Salesforce Developer Journey — Apex Day 06

## Topic: SOQL Relationship Queries

**Learning track:** Salesforce Platform Developer I (PD1)  
**Day:** 06  
**Focus:** Parent-to-child and child-to-parent SOQL, related record collections, and query results

## Learning Objectives

- Query parent fields from child records using dot notation.
- Query child records from parent records using a relationship subquery.
- Iterate through related records in Apex.
- Handle parent records that have no related child records.
- Understand how Apex filtering differs from SOQL filtering.
- Review aggregate queries and `AggregateResult` access.

## 1. Child-to-Parent SOQL: Contact → Account

Use the relationship name `Account` to access parent fields from a Contact.

```apex
List<Contact> contacts = [
    SELECT Id, Name, AccountId, Account.Name, Account.Industry
    FROM Contact
    WHERE AccountId != null
    LIMIT 20
];

for (Contact con : contacts) {
    System.debug('Contact: ' + con.Name);
    System.debug('Account: ' + con.Account.Name);
    System.debug('Industry: ' + con.Account.Industry);
}
```

**Key point:** `AccountId` is the lookup field holding the parent record ID; `Account` is the relationship reference used to access parent fields.

## 2. Parent-to-Child SOQL: Account → Contacts

Use a nested query and the child relationship name `Contacts`.

```apex
List<Account> accounts = [
    SELECT Id, Name,
           (SELECT Id, Name, Email FROM Contacts)
    FROM Account
    LIMIT 10
];

for (Account acc : accounts) {
    System.debug('Account: ' + acc.Name);
    System.debug('Contact count: ' + acc.Contacts.size());

    for (Contact con : acc.Contacts) {
        System.debug('Contact: ' + con.Name + ' | Email: ' + con.Email);
    }
}
```

**Key point:** When the child relationship has been queried, an Account with no matching Contacts has an empty `Contacts` collection; `.size()` returns `0`.

## 3. Identify Accounts With More Than Two Contacts

The following query retrieves up to 50 Accounts. Apex then identifies those with more than two related Contacts.

```apex
List<Account> accounts = [
    SELECT Id, Name,
           (SELECT Id FROM Contacts)
    FROM Account
    LIMIT 50
];

for (Account acc : accounts) {
    if (acc.Contacts.size() > 2) {
        System.debug('Account with more than 2 Contacts: ' + acc.Name);
    }
}
```

**Important:** This code filters **after** the query; the SOQL query itself does not return only Accounts with more than two Contacts. `LIMIT 50` applies to the queried Accounts.

## 4. Aggregate SOQL Review: Count Contacts per Account

Use `GROUP BY` and `COUNT()` to calculate Contact totals directly in SOQL.

```apex
List<AggregateResult> contactCounts = [
    SELECT AccountId, COUNT(Id) totalContacts
    FROM Contact
    WHERE AccountId != null
    GROUP BY AccountId
];

for (AggregateResult result : contactCounts) {
    Id accountId = (Id) result.get('AccountId');
    Integer total = (Integer) result.get('totalContacts');

    System.debug('Account ID: ' + accountId);
    System.debug('Total Contacts: ' + total);
}
```

**Key point:** Use `AggregateResult.get('fieldOrAlias')` and cast the returned `Object` to the expected Apex type. This is a review of aggregate querying, not a replacement for the relationship-query exercises.

## Day 06 PD1 Quiz Results

| Question | Topic | Answer | Score |
|---|---|---|---|
| Q1 | Parent-to-child SOQL | B | 2/2 |
| Q2 | Empty child collections | B | 2/2 |
| Q3 | Child-to-parent SOQL | C | 2/2 |
| Q4 | `AggregateResult` and casting | B | 2/2 |
| Q5 | SOQL versus Apex filtering | C | 2/2 |
| **Total** | | **5/5 correct** | **10/10** |

## Key Takeaways

1. Child-to-parent queries use relationship dot notation, such as `Contact.Account.Name`.
2. Parent-to-child queries use a nested subquery with the child relationship name, such as `FROM Contacts`.
3. Queried child relationship collections can be empty without being `null`.
4. `AggregateResult` values are accessed with `.get()` and explicit casts.
5. Filtering in Apex after a query is different from applying filters in SOQL.

## Next Learning Goals

- Compare Apex-side filtering with SOQL-side filtering.
- Practice bulk-safe collection patterns and understand governor limits.
- Continue scenario-based PD1 questions aligned with completed Apex topics.

---

*This README documents Day 06 concepts and quiz results. Adjust class names and file paths to match the actual Apex source files in the repository.*
