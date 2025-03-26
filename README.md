# 🚀 GitHub Repository Access Management Script

## 📌 Description
This repository contains a **Shell Script** (`list_read_access.sh`) that automates repository access monitoring using the **GitHub API**. It fetches and displays a list of users who have **read access** to a specified repository, eliminating manual checks.

## 🔹 Features
- ✅ Lists **users with read access** (`pull` permissions) to a GitHub repository.
- ✅ **Authenticates** via GitHub API using a **Personal Access Token (PAT)**.
- ✅ Includes **error handling** for authentication failures and missing parameters.
- ✅ Logs missing access information to `access_log.txt` if no users are found.
- ✅ Uses **`jq`** for JSON parsing (ensure it's installed).

---

## 🔧 Setup & Usage

### **1️⃣ Prerequisites**
- A **Linux/macOS system** (e.g., EC2 instance).
- `bash`, `curl`, and `jq` installed.
- A **GitHub Personal Access Token (PAT)** with `repo` permissions.
- A **GitHub username**.

### **2️⃣ Set Up Authentication**
Export your GitHub credentials as environment variables:

export USERNAME="your_github_username"
export TOKEN="your_personal_access_token"

### **3️⃣ Run the Script**

./list_read_access.sh <repository_owner> <repository_name>
