# Salesforce Developer Journey 🚀

A hands-on learning repository documenting my progress toward the **Salesforce Platform Developer I (PD1)** certification.

## 🎯 Learning Goal

Build practical Salesforce development skills through daily Apex coding exercises and certification-aligned study. The 60-day plan targets exam readiness on **Day 61**.

- **Days 1–45:** Approximately 80% hands-on development and 20% PD1 topic review.
- **Days 46–60:** Certification revision, scenario questions, timed mock exams, and weak-area practice.

## 📈 Progress Tracker

| Day | Topic | Status | Source |
| --- | --- | --- | --- |
| 01 | Apex variables, data types, calculations, and conditional logic | ✅ Completed | [Day01Variables.cls](force-app/main/default/classes/Day01Variables.cls) |
| 02 | Apex loops and practical iteration exercises | ✅ Completed | [Day02Loops.cls](force-app/main/default/classes/Day02Loops.cls) |
| 03 | Apex collections (List, Set, Map), SOQL and bulkification basics | ✅ Completed — 8 challenges, PD1 quiz 5/5 | `practiceEmployeeList()` through `practiceContactAccountCollections()` (add class link after saving code) |
| 04 | SOQL in Apex | ⏭️ Next | — |
| 05–45 | Hands-on Salesforce development and topic-aligned PD1 study | ⬜ Upcoming | — |
| 46–60 | PD1 revision and mock exams | ⬜ Upcoming | — |
| 61 | Target exam-readiness day | 🎯 Goal | — |

## 📚 Completed Practice

### Day 01 — Apex Variables and Conditional Logic

**File:** [`Day01Variables.cls`](force-app/main/default/classes/Day01Variables.cls)

Topics and exercises:
- Declaring and assigning `String`, `Integer`, `Decimal`, and `Boolean` variables.
- Printing values using `System.debug()`.
- Calculating monthly bonuses, monthly salary, and annual compensation.
- Applying `if`/`else` logic to incentive eligibility.
- Applying `if`/`else if`/`else` logic to performance-based bonuses.
- Validating performance ratings before calculating bonuses.

**Takeaway:** Practice turning simple business requirements into readable Apex methods with calculations and branching logic.

### Day 02 — Apex Loops

**File:** [`Day02Loops.cls`](force-app/main/default/classes/Day02Loops.cls)

Topics and exercises:
- Basic `for` loops and annual salary accumulation.
- Counting odd and even numbers, including a `Math.mod()` approach.
- Summing odd and even numbers from 1 through 100.
- Printing multiplication tables using simple and nested loops.
- Basic `while` loops and calculating months needed to reach a savings goal.
- Basic `do-while` loops and simulating ATM withdrawals with a balance check and `break`.

**Takeaway:** Choose a loop based on the stopping condition and understand how counters, accumulators, and nested iterations behave.

### Day 03 — Apex Collections

**Status:** Completed 8 hands-on challenges; PD1 quiz score **5/5**.

Methods practiced:

1. `practiceEmployeeList()` — create a `List<String>`, add employees, use `size()` and `get()`.
2. `practiceEmployeeLoop()` — iterate over a List using an enhanced `for` loop and apply conditional logic.
3. `practiceDepartmentSet()` — use `Set<String>` to store unique department names and iterate through them.
4. `practiceDepartmentOperations()` — use `contains()`, `remove()`, and `size()`; handle successful and unsuccessful removals.
5. `practiceEmployeeMap()` — use `Map<Integer, String>` with `put()`, `get()`, `size()`, and `containsKey()`.
6. `practiceEmployeeMapLoop()` — iterate over Map keys with `keySet()` and retrieve values dynamically.
7. `practiceAccountMap()` — query Account records into `Map<Id, Account>` and print Account fields.
8. `practiceContactAccountCollections()` — query Contacts into `List<Contact>`, collect unique `AccountId` values in `Set<Id>`, query related Accounts into `Map<Id, Account>`, and look up Account names.

Salesforce development concepts:
- Collections: **List, Set, Map** and their common methods.
- SOQL queries and bind variables such as `WHERE Id IN :accountIds`.
- Salesforce sObjects: `Account`, `Contact`, and record IDs.
- **Bulkification fundamentals:** avoid placing SOQL queries inside loops; query related records once and use a Map for lookups.
- **Defensive coding:** use `containsKey()` or a null check before accessing fields on a Map lookup result that might be missing.

**PD1 assessment:** 5 correct answers out of 5 (100%).

**Takeaway:** Use Lists for ordered records, Sets for unique values/IDs, and Maps for key-based lookups. Combine collections with SOQL to write scalable Apex.

## 🗂️ Repository Layout

```text
force-app/
  main/
    default/
      classes/
        Day01Variables.cls
        Day01Variables.cls-meta.xml
        Day02Loops.cls
        Day02Loops.cls-meta.xml
        # Add Day 3 Apex class and metadata here when saved
README.md
```

This is a Salesforce DX project. Apex classes live in `force-app/main/default/classes/` along with their metadata files.

## 🛠️ Tools

- Salesforce Apex
- Salesforce DX project structure
- Visual Studio Code
- Git and GitHub

## 🔜 Next Up

**Day 04: SOQL in Apex** — query Salesforce records, apply filters and sorting, explore relationship queries, and learn governor-limit-safe query patterns.

---

*This README is updated as new practice is completed. Completion indicates learning and coding practice, not a certification result.*
