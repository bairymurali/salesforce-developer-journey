# Salesforce Developer Journey 🚀

A hands-on learning repository documenting my progress in **Salesforce Apex development** and preparation for the **Salesforce Platform Developer I (PD1)** certification.

## 🎯 Goals

- Build strong fundamentals in Apex, SOQL, DML, and Salesforce development.
- Practice writing clean, readable, bulk-safe Apex code.
- Learn triggers, asynchronous Apex, testing, and security.
- Prepare for the Salesforce Platform Developer I certification with a **60-day plan**, aiming to be exam-ready on **Day 61**.
- Develop JavaScript and Lightning Web Components (LWC) skills alongside Apex.

## 📅 Learning Plan

| Days | Focus |
| --- | --- |
| 1–15 | Apex fundamentals, collections, SOQL, and JavaScript basics |
| 16–30 | Triggers, bulkification, testing, and LWC fundamentals |
| 31–45 | Advanced Apex, security, integration, and hands-on projects |
| 46–60 | PD1 revision, scenario questions, mock exams, and weak-area review |
| 61 | Target PD1 exam readiness |

**Daily study plan (Days 4–45):** 90 minutes Apex, 60 minutes JavaScript/LWC, and 30 minutes PD1 preparation.

## ✅ Progress Tracker

| Day | Topics | Status |
| --- | --- | --- |
| 01 | Apex fundamentals and introductory coding practice | ✅ Completed |
| 02 | Apex conditions, loops, and practice exercises | ✅ Completed |
| 03 | Apex collections: `List`, `Set`, `Map`, and Account/Contact examples | ✅ Completed |
| 04 | Collections, SOQL, grouping Contacts, and aggregate queries | ✅ Completed |
| 05–45 | Continued Apex and hands-on development | ⏳ Upcoming |
| 46–60 | Certification-focused revision and mock exams | ⏳ Upcoming |

## 📘 Day 04 — Collections and SOQL

**Class:** [`Day04CollectionsAndSOQL.cls`](force-app/main/default/classes/Day04CollectionsAndSOQL.cls)  
**Anonymous Apex script:** [`day04.apex`](scripts/apex/day04.apex)

Topics practiced:

1. **Technology Accounts:** Query Accounts by Industry, collect unique IDs in a `Set<Id>`, and use a `Map<Id, Account>`.
2. **Group Contacts by Account:** Use `Map<Id, List<Contact>>` to group Contact records by their Account IDs.
3. **Count Contacts by Account:** Use `Map<Id, Integer>` and `containsKey()` to count Contacts per Account.
4. **Aggregate SOQL:** Use `COUNT(Id)`, `GROUP BY`, and `AggregateResult` to retrieve Contact counts directly from Salesforce.

### Key lessons

- Use `List` for ordered collections, `Set` for unique values, and `Map` for key-value lookups.
- Avoid unnecessary repeat SOQL queries when records are already available in memory.
- Avoid SOQL queries inside loops to help stay within governor limits.
- Use aggregate SOQL when only summary counts are required.
- Cast values returned by `AggregateResult.get()` to the appropriate Apex types.

**Day 04 practice review:** 38/40 points (**95%**), including a bonus exercise. This is a code-review score, not a certification exam score.

## 🗂️ Repository Structure

```text
salesforce-developer-journey/
├── force-app/
│   └── main/
│       └── default/
│           └── classes/
│               ├── Day04CollectionsAndSOQL.cls
│               └── Day04CollectionsAndSOQL.cls-meta.xml
├── scripts/
│   └── apex/
│       └── day04.apex
└── README.md
```

*The tree highlights Day 04 files; other Salesforce project files may also be present.*

## 🛠️ Tools

- Salesforce Developer Org
- Visual Studio Code
- Salesforce Extension Pack / Salesforce CLI
- Git and GitHub

## 🔜 Next Steps

- Continue Apex practice from **Day 05**.
- Practice JavaScript fundamentals in a separate repository: [javascript-practice](https://github.com/bairymurali/javascript-practice).
- Progress to LWC and Apex integration projects.
- Review certification topics and measure readiness through timed mock exams.

---

*This repository is a learning journal. Examples are written for practice and should be tested and reviewed before production use.*
