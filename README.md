# PythonRobot

Robot Framework UI automation using Python + Selenium, executed locally and in GitHub Actions.

## 📌 Project Overview
This project automates a login scenario using:
- **Robot Framework**
- **SeleniumLibrary**
- **Google Chrome (headless in CI)**

Current test suite:
- `TestCases/TC1.robot` — validates login flow for ParaBank and checks for **Accounts Overview** text.

---

## 📁 Project Structure

```text
.
├── .github/
│   └── workflows/
│       └── robot-tests.yml
├── TestCases/
│   └── TC1.robot
├── requirements.txt
└── README.md
```

---

## ✅ Prerequisites (Local)
- Python 3.10+ (3.10 recommended to match CI)
- Google Chrome installed
- pip

---

## ⚙️ Local Setup & Run

```bash
# 1) Clone
git clone https://github.com/hiralsheth/PythonRobot.git
cd PythonRobot

# 2) Create virtual environment (recommended)
python -m venv .venv

# Windows
.venv\Scripts\activate

# macOS/Linux
source .venv/bin/activate

# 3) Install dependencies
python -m pip install --upgrade pip
pip install -r requirements.txt

# 4) Run tests
robot --outputdir results TestCases/
```

After execution, reports are available in:
- `results/report.html`
- `results/log.html`
- `results/output.xml`

---

## 🤖 GitHub Actions CI

Workflow file: `.github/workflows/robot-tests.yml`

It runs on:
- push to `main`
- pull request to `main`

The workflow:
1. checks out code
2. sets up Python
3. installs dependencies
4. ensures Chrome is installed
5. runs Robot tests
6. uploads `results/` as artifact (`Robot-Reports`)

---

## 🧪 Notes
- Tests run headless in CI using Chrome options in `TC1.robot`.
- If your locators or test data change on target site, update `TestCases/TC1.robot`.

---

## 🔧 Troubleshooting
- **Chrome launch fails in CI**: keep `--no-sandbox` and `--disable-dev-shm-usage` options.
- **Element not found**: target page may have changed; update selectors.
- **Session/login unstable**: add explicit waits in Robot keywords.

---

## 📦 Dependencies
From `requirements.txt`:
- `robotframework`
- `robotframework-seleniumlibrary`
- `selenium`
