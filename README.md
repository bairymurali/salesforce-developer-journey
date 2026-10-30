# Salesforce Developer Journey 🚀

A hands-on Salesforce development learning repository documenting daily **Apex practice**, **SOQL**, **Salesforce DX**, and **Platform Developer I (PD1)** certification preparation.

**Repository:** [bairymurali/salesforce-developer-journey](https://github.com/bairymurali/salesforce-developer-journey)  
**Current progress:** Apex **Day 06 completed**  
**Goal:** Be ready for the Salesforce Platform Developer I certification exam on **Day 61**.

## 🎯 Learning Plan

| Phase | Days | Focus |
|---|---|---|
| Hands-on development + PD1 preparation | 01–45 | Daily Apex practice, JavaScript/LWC learning, and topic-aligned PD1 questions |
| Certification revision | 46–60 | Review, scenario-based questions, timed mock exams, and weak-area practice |
| Target | 61 | PD1 exam readiness |

**Daily learning allocation (Days 04–45):** 90 minutes Apex, 60 minutes JavaScript/LWC, and 30 minutes PD1 preparation. JavaScript practice is maintained in the separate [`javascript-practice`](https://github.com/bairymurali/javascript-practice) repository.

## 📁 Salesforce DX Project Structure

```text
salesforce-developer-journey/
├── README.md
└── salesforce-dx/
    ├── sfdx-project.json
    ├── force-app/
    │   └── main/
    │       └── default/
    │           └── classes/
    │               ├── Day01Variables.cls
    │               ├── Day02Loops.cls
    │               ├── Day04CollectionsAndSOQL.cls
    │               ├── Day05Relationships.cls
    │               └── Day06RelationshipQueries.cls
    └── scripts/
        └── apex/
            ├── day01.apex
            ├── day04.apex
            └── day06.apex
```

> Structure shown is illustrative of the learning files; additional classes, metadata (`.cls-meta.xml`), and scripts may exist. Day 03 collection exercises are documented below without assuming an unverified class filename.

## 📚 Daily Apex Learning Log

### ✅ Day 01 — Variables, Data Types, and Conditional Logic

**Class:** `Day01Variables.cls`

**Methods practiced:**
- `practiceVariables()` — declare and use Apex variables, data types, and debug statements.
- `calculateSalary()` — calculate monthly bonus, monthly salary, annual salary, and conditional incentives.
- `calculatePerformanceBonus()` — use `if / else if / else` to determine a bonus from a performance rating.

**Concepts:** `String`, `Integer`, `Decimal`, `Boolean`, arithmetic operations, conditional logic, `System.debug()`, and executing static methods from anonymous Apex.

**Example:**
```apex
Decimal basicSalary = 50000;
Integer performanceRating = 4;
Decimal bonus = 0;

if (performanceRating == 5) {
    bonus = basicSalary * 0.20;
} else if (performanceRating == 4) {
    bonus = basicSalary * 0.15;
} else if (performanceRating == 3) {
    bonus = basicSalary * 0.10;
}

System.debug('Bonus: ' + bonus);
```

### ✅ Day 02 — Loops and Control Flow

**Class:** `Day02Loops.cls`

**Methods practiced:**
- `calculateAnnualSalaryUsingLoop()` — total salary over 12 months.
- `identifyEvenOddNumbers()` and `identifyEvenOddNumbersAnotherWay()` — classify numbers using counter/toggle approaches.
- `sumOfEvenAndSumOfOdd()` — count and sum even/odd numbers.
- `printMultiplicationTable()` — generate a multiplication table.
- `printMultipleTables()` — practice nested loops.
- `calculateSavingsGoal()` — use a `while` loop to reach a savings target.
- `simulateATMWithdrawals()` — use `do-while` and validate sufficient balance.

**Concepts:** `for`, enhanced `for`, nested `for`, `while`, `do-while`, Boolean toggling, accumulators, and input/balance checks.

### ✅ Day 03 — Apex Collections

**Topics:** `List`, `Set`, `Map`, iteration, and collections populated with SOQL results.

**Methods practiced:**
- `practiceEmployeeList()` — add, count, and access List elements.
- `practiceEmployeeLoop()` — iterate over employees and apply conditions.
- `practiceDepartmentSet()` — understand unique Set values.
- `practiceDepartmentOperations()` — `contains()`, `remove()`, and `size()`.
- `practiceEmployeeMap()` — add, retrieve, and check Map entries.
- `practiceEmployeeMapLoop()` — iterate over `keySet()`.
- `practiceAccountMap()` — create `Map<Id, Account>` from SOQL results.
- `practiceContactAccountCollections()` — collect Account IDs from Contacts, query matching Accounts, and use a Map for lookups.

**Key pattern:**
```apex
List<Contact> contacts = [
    SELECT Id, Name, AccountId
    FROM Contact
    WHERE AccountId != null
    LIMIT 20
];

Set<Id> accountIds = new Set<Id>();
for (Contact con : contacts) {
    accountIds.add(con.AccountId);
}

Map<Id, Account> accountMap = new Map<Id, Account>([
    SELECT Id, Name, Industry
    FROM Account
    WHERE Id IN :accountIds
]);
```

**Practice:** 8 collection challenges completed; collection assessment 5/5.

### ✅ Day 04 — Advanced Collections and SOQL

**Class:** `Day04CollectionsAndSOQL.cls`  
**Execution script:** `scripts/apex/day04.apex`

**Methods practiced:**
- `getTechnologyAccounts()` — filter Accounts by Industry; collect IDs in a Set and retrieve records into a Map.
- `groupContactsByAccount()` — group Contacts by Account with `Map<Id, List<Contact>>`; also practiced contact-count mapping with `Map<Id, Integer>`.
- `countContactsUsingAggregate()` — group and count Contact records with aggregate SOQL.

**Key pattern:**
```apex
List<AggregateResult> contactCounts = [
    SELECT AccountId, COUNT(Id) totalContacts
    FROM Contact
    WHERE AccountId != null
    GROUP BY AccountId
];

for (AggregateResult row : contactCounts) {
    Id accountId = (Id) row.get('AccountId');
    Integer count = (Integer) row.get('totalContacts');
    System.debug(accountId + ': ' + count);
}
```

**Practice review:** 38/40 (95%).

### ✅ Day 05 — SOQL Relationship Queries

**Class:** `Day05Relationships.cls`

**Methods practiced:**
- `getContactsWithAccounts()` — child-to-parent query (`Contact` → `Account`).
- `getAccountsWithContacts()` — parent-to-child query (`Account` → `Contacts`).
- `countContactsPerAccount()` — count related Contacts per Account.
- `findAccountsWithMultipleContacts()` — identify Accounts with multiple related Contacts.

**Concepts:** relationship navigation, nested subqueries, collections, Sets/Maps, and avoiding SOQL inside loops.

**Practice review:** 37/40. **Day 05 PD1 quiz:** 10/10.

### ✅ Day 06 — Relationship Query Practice and Record Navigation

**Class:** `Day06RelationshipQueries.cls`  
**Execution script:** `scripts/apex/day06.apex`

**Methods practiced:**
- `getContactsWithAccountDetails()` — retrieve Contacts and their related Account fields with child-to-parent SOQL.
- `getAccountsWithContactDetails()` — retrieve Accounts with nested Contacts using parent-to-child SOQL; iterate and inspect `acc.Contacts.size()`.

**Child-to-parent example:**
```apex
List<Contact> contacts = [
    SELECT Id, Name, Account.Name, Account.Industry
    FROM Contact
    WHERE AccountId != null
    LIMIT 20
];

for (Contact con : contacts) {
    System.debug(con.Name + ' — ' + con.Account.Name);
}
```

**Parent-to-child example:**
```apex
List<Account> accounts = [
    SELECT Id, Name, (SELECT Id, Name, Email FROM Contacts)
    FROM Account
    LIMIT 50
];

for (Account acc : accounts) {
    System.debug('Account: ' + acc.Name);
    System.debug('Contact count: ' + acc.Contacts.size());
}
```

**Important observations:**
- Parent-to-child SOQL uses the **child relationship name**, `Contacts`, in the subquery.
- Child-to-parent SOQL uses dot notation such as `con.Account.Name`.
- A queried child relationship with no matching records is an **empty collection** (`size() == 0`).
- Filtering in an Apex `if` statement is different from filtering directly in SOQL.
- Aggregate values are read with `AggregateResult.get('alias')` and cast to the correct type.

**Hands-on challenge reviews:** 8/10 and 9/10.  
**Day 06 PD1 quiz:** **10/10** (5/5 correct).

## 🧠 PD1 Certification Progress

| Day | Recorded PD1 Result | Notes |
|---|---:|---|
| Day 01 | — | No recorded quiz score |
| Day 02 | — | No recorded quiz score |
| Day 03 | 5/5 | Collections assessment |
| Day 04 | 6/10 | Topic-aligned PD1 quiz |
| Day 05 | 10/10 | Relationship topics |
| Day 06 | **10/10** | SOQL relationships, `AggregateResult`, and filtering |

> Scores are shown as recorded; the Day 03 assessment uses a five-point scale. Quiz results reflect daily topic practice, not a full-length PD1 mock exam.

## 🛠️ Tools and Environment

- Salesforce Developer Edition org
- Salesforce CLI (`sf`)
- Salesforce DX project
- Visual Studio Code and Salesforce extensions
- Git and GitHub for version control
- Anonymous Apex scripts for method execution and debug-log inspection

## ▶️ How to Run the Apex Exercises

From the `salesforce-dx` project directory, confirm the target org and deploy the classes:

```bash
sf org list
sf project deploy start --source-dir force-app/main/default/classes --target-org <YOUR_ORG_ALIAS>
```

Execute an anonymous Apex script (example for Day 06):

```bash
sf apex run --file scripts/apex/day06.apex --target-org <YOUR_ORG_ALIAS>
```

A script can call methods such as:

```apex
Day06RelationshipQueries.getContactsWithAccountDetails();
Day06RelationshipQueries.getAccountsWithContactDetails();
```

Replace `<YOUR_ORG_ALIAS>` with your authorized Developer Edition org alias. You can also execute individual static methods from the VS Code Salesforce tooling.

## 💡 Development Practices Reinforced

1. Keep code organized into focused classes and reusable methods.
2. Use clear variable names and explanatory comments.
3. Use Sets and Maps to avoid repeated lookups and unnecessary queries.
4. Prefer querying related records together rather than placing SOQL inside loops.
5. Check query results and relationship collection sizes before processing.
6. Use anonymous Apex scripts to test methods and review debug logs.
7. Commit completed learning exercises to GitHub with descriptive messages.

## ⏭️ Next Steps

Continue with Day 07 Apex exercises, build on relationship queries and collections, and progress toward DML, bulk-safe processing, and additional PD1 topics as they are studied. Continue JavaScript/LWC learning in the separate JavaScript repository.

---

**Learning status:** Apex Days **01–06 complete** · **Day 06 PD1: 10/10** · **Day 61 exam-readiness target**.
