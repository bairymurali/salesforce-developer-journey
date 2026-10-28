# Salesforce Developer Journey 🚀

A hands-on Salesforce development learning repository documenting my progress in **Apex**, **SOQL**, **Salesforce DX**, and preparation for the **Salesforce Platform Developer I (PD1)** certification.

## 🎯 Learning goal

Follow a **60-day learning plan** and be ready for the PD1 exam on **Day 61**.

- **Days 1–45:** Daily hands-on Salesforce development plus topic-aligned PD1 preparation.
- **Days 46–60:** Certification revision, scenario-based practice, timed mock exams, and review of weak areas.
- **Daily schedule (Days 4–45):** 90 minutes Apex, 60 minutes JavaScript/LWC preparation, and 30 minutes PD1 practice.

> JavaScript exercises are maintained separately in the `javascript-practice` repository.

## 📈 Progress

| Day | Apex topic | Status |
| --- | --- | --- |
| 01 | Apex fundamentals: variables, data types, calculations, and conditionals | ✅ Completed |
| 02 | Control flow: loops, conditions, and practical calculations | ✅ Completed |
| 03 | Collections: List, Set, Map, and introductory SOQL | ✅ Completed |
| 04 | Advanced collections, SOQL filtering, grouping, and aggregate queries | ✅ Completed |
| 05 | SOQL relationships: child-to-parent, parent-to-child, and Contact counting | ✅ Completed |
| 06 | DML operations and bulk processing | ⏳ Planned |

**Current milestone:** Apex Days **1–5 completed**. Day 05 PD1 practice score: **10/10**.

## 🧑‍💻 Apex exercises by day

### Day 01 — Variables and fundamentals

**Class:** `Day01Variables.cls`

- `practiceVariables()` — Declare and work with Apex variables.
- `calculateSalary()` — Calculate bonus, monthly salary, annual salary, and incentive.
- `calculatePerformanceBonus()` — Apply bonus percentages based on performance rating.

### Day 02 — Loops and control flow

**Class:** `Day02Loops.cls`

- `calculateAnnualSalaryUsingLoop()` — Calculate annual salary using a `for` loop.
- `identifyEvenOddNumbers()` and `identifyEvenOddNumbersAnotherWay()` — Classify even and odd numbers.
- `sumOfEvenAndSumOfOdd()` — Accumulate totals for even and odd numbers.
- `printMultiplicationTable()` and `printMultipleTables()` — Generate multiplication tables.
- `calculateSavingsGoal()` — Use a `while` loop to reach a savings target.
- `simulateATMWithdrawals()` — Model withdrawals using `do-while` and balance checks.

### Day 03 — Collections and SOQL

**Class:** `Day03Collections.cls`

- Practice creating, reading, and iterating over `List` values.
- Use `Set` to store unique department names.
- Use `Map` to associate employee IDs with employee names.
- Query Account records into `Map<Id, Account>`.
- Collect Contact `AccountId` values in a `Set<Id>` and retrieve matching Accounts with SOQL.

### Day 04 — Advanced collections and aggregate SOQL

**Class:** Day 04 Apex class in `force-app/main/default/classes/`.

- `getTechnologyAccounts()` — Query Technology Accounts and collect their IDs.
- `groupContactsByAccount()` — Group Contacts using `Map<Id, List<Contact>>` and count them with `Map<Id, Integer>`.
- `countContactsUsingAggregate()` — Count Contacts by Account using `AggregateResult`, `COUNT()`, and `GROUP BY`.

### Day 05 — SOQL relationships

**Class:** `Day05Relationships.cls`

- `getContactsWithAccounts()` — Retrieve parent Account fields from Contact using relationship dot notation.
- `getAccountsWithContacts()` — Retrieve related Contacts with a parent-to-child subquery.
- `countContactsPerAccount()` — Count related Contacts and calculate an overall total.
- `findAccountsWithMultipleContacts()` — Identify Accounts having more than two Contacts.

**Day 05 Apex practice review:** 37/40. **Day 05 PD1 quiz:** 10/10.

## 🗂️ Project structure

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
    │               ├── Day03Collections.cls
    │               ├── Day05Relationships.cls
    │               └── ...
    └── scripts/
        └── apex/
            ├── day01.apex
            ├── day05.apex
            └── ...
```

> The tree is illustrative. Use the actual class and script filenames in your local checkout; the Day 04 class name and some script names may differ.

## 🛠️ Development tools

- Visual Studio Code with Salesforce extensions
- Salesforce CLI (`sf`)
- Salesforce Developer Org
- Git and GitHub
- Java (for Salesforce tooling)

## ▶️ Running Apex practice

Open a terminal in the Salesforce DX project directory (the folder containing `sfdx-project.json`).

**1. Confirm the connected Salesforce org**

```bash
sf org list
```

**2. Deploy updated Apex classes**

```bash
sf project deploy start --source-dir force-app/main/default/classes --target-org pd1-practice
```

**3. Execute an anonymous Apex script**

```bash
sf apex run --file scripts/apex/day05.apex --target-org pd1-practice
```

Example contents of `scripts/apex/day05.apex`:

```apex
Day05Relationships.getContactsWithAccounts();
Day05Relationships.getAccountsWithContacts();
Day05Relationships.countContactsPerAccount();
Day05Relationships.findAccountsWithMultipleContacts();
```

The script calls methods in the deployed Apex class. Check the terminal output and Salesforce debug logs for results. Actual SOQL output depends on records available in the connected org.

## 📚 Key concepts learned

- Apex syntax, variables, numeric calculations, and conditional logic
- `for`, enhanced `for`, `while`, and `do-while` loops
- `List`, `Set`, and `Map` collections
- SOQL filtering and `IN` clauses
- SOQL aggregate functions and `GROUP BY`
- Child-to-parent relationship queries (`Account.Name` from Contact)
- Parent-to-child relationship subqueries (`FROM Contacts` within Account)
- Avoiding SOQL queries inside loops to reduce governor-limit risks

## 🏆 Certification preparation

PD1 practice questions are aligned with the topics already studied. The Day 05 quiz covered relationship queries, Sets, Maps, governor limits, and Apex loops.

| Quiz | Score |
| --- | --- |
| Day 05 | **10/10 (100%)** |

**Next focus:** Day 06 — DML (`insert`, `update`, `delete`, `upsert`) and bulk-processing patterns. Triggers will be introduced later in the learning plan.

## 🔄 Updating the repository

From the repository root:

```bash
git status
git add README.md
git diff --cached --check
git commit -m "docs: update Apex learning progress through Day 05"
git push origin main
```

If the README is inside `salesforce-dx/`, run these commands from that directory or adjust the path passed to `git add`.

---

*Learning by building, testing, reviewing, and improving Apex code every day.*
