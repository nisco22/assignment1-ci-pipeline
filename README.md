# Secure CI Pipeline and Containerisation

## 📌 Overview

This project demonstrates the implementation of a **secure Continuous Integration (CI) pipeline** with automated testing, static analysis, and containerisation using Docker.

The goal is to ensure:

* Code quality enforcement
* Security vulnerability detection
* Automated build and testing
* Secure container deployment

---

## 🛠️ Technologies Used

* Python 3.11
* GitHub Actions (CI Pipeline)
* Flake8 (Linting)
* Bandit (Security Scanning - SAST)
* Pytest (Unit Testing)
* Docker (Containerisation)

---

## 🔐 Access Control (Security Measures)

The repository enforces strict access control using:

### ✔ Protected Branches

* The `main` branch is protected
* Direct pushes are **not allowed**

### ✔ Pull Request Workflow

* All changes must go through a **Pull Request (PR)**
* At least **one reviewer approval is required**
* CI checks must pass before merging

### ✔ Pre-commit Hooks

* Flake8 is configured as a pre-commit hook
* Prevents committing poorly formatted or insecure code

---

## ⚙️ CI Pipeline Overview

The CI pipeline is implemented using GitHub Actions and includes:

### 1. Build Stage

* Validates Python syntax using:

  ```
  python -m py_compile app.py
  ```

### 2. Test Stage

* Runs unit tests using Pytest
* Generates coverage reports

### 3. Static Analysis (SAST)

* Flake8 → Code quality checks
* Bandit → Security vulnerability scanning

### 4. Optimization (Caching)

* Dependencies are cached using GitHub Actions cache
* Improves pipeline performance and speed

---

## ⚡ Fail-Fast Strategy

The pipeline follows a **fail-fast approach**:

* Stops immediately if:

  * Build fails
  * Tests fail
  * Linting fails
  * Security scan fails

This ensures:

* Faster feedback
* Reduced resource usage
* Higher code quality

---

## 🐳 Containerisation

The application is containerised using Docker with security best practices:

### 🔒 Security Hardening

* Multi-stage build (reduces image size)
* Minimal base image (Alpine Linux)
* Non-root user execution
* No hardcoded secrets

### ▶️ Build and Run

```bash
docker build -t secure-python-app .
docker run secure-python-app
```

Expected output:

```
5
```

---

## 📁 Project Structure

```
secure-ci-python-app/
│── app.py
│── test_app.py
│── requirements.txt
│── Dockerfile
│── .flake8
│── .pre-commit-config.yaml
│── .github/workflows/ci.yml
```

---

## 🚀 How to Contribute

1. Create a new branch:

   ```
   git checkout -b feature-branch
   ```

2. Make changes and commit:

   ```
   git add .
   git commit -m "Your message"
   ```

3. Push branch:

   ```
   git push origin feature-branch
   ```

4. Create a Pull Request on GitHub

---

## 📊 CI/CD Workflow Summary

1. Developer pushes code
2. Pull Request is created
3. CI pipeline runs:

   * Build
   * Test
   * Security Scan
4. If all checks pass → Code is merged
5. Docker container can be built and deployed

---

## 📄 Documentation

* CI pipeline configuration: `.github/workflows/ci.yml`
* Docker configuration: `Dockerfile`
* Linting rules: `.flake8`
* Pre-commit hooks: `.pre-commit-config.yaml`

---

## ✅ Conclusion

This project demonstrates how to build a secure and automated CI pipeline with integrated testing, security scanning, and containerisation. It follows industry best practices to ensure high-quality and secure software delivery.
