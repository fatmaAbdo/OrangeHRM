
# 🧪 OrangeHRM Test Automation Project

Automated test framework for **OrangeHRM** using **Robot Framework** and **Selenium**.  
The project follows **Page Object Model (POM)** and is designed to be:  
✨ Reusable | 📈 Scalable | 🛠 Maintainable

---

## 🚀 Tech Stack
- Robot Framework
- SeleniumLibrary
- Python
- ChromeDriver

---

## ⚙️ Setup
Install dependencies:
```bash
pip install -r requirements.txt
---
▶️ Run Tests
Run All Tests
robot tests/

Run Smoke Tests
robot --include smoke tests/

Run Regression Tests
robot --include regression tests/
---

🧠 Framework Highlights
Page Object Model (POM)

Custom reusable keywords
Custom assertions
Dynamic waits (no hard sleeps)
Unique test data generation
Tag-based execution (smoke / regression)

---

✅ Covered Test Scenarios
Admin: Create system user & login

PIM: Add employee & verify data

Recruitment: Create vacancy & add candidate

Authentication: Login & logout
=======
