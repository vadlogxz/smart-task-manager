# Smart Task Manager

## 📌 About
Offline-first task manager with rule-based task lifecycle.
Focus on clean architecture and business logic separation.

## 🧠 Core Idea
Tasks are not just "done / not done".
Each task has a lifecycle with strict rules.

## 🏗 Architecture
- Presentation (Flutter UI)
- Domain (Entities, UseCases, Rules)
- Data (Repositories, Local DB)

## ⚙️ Business Rules
- Task expires automatically after deadline
- Blocked task cannot be completed
- Expired task can only be reactivated

## 🧱 Tech Stack
- Flutter
- Riverpod
- Isar
- Clean Architecture (simplified)

## 🚧 Project Status
MVP in progress
