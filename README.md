# GitHub Repository Search App 🚀

A simple and efficient web app built on the Roda framework, designed for quickly and effectively searching GitHub repositories. This application is crafted based on the renowned application skeleton by [Jeremy Evans](https://github.com/jeremyevans).

## Introduction 🌟

This app provides a user-friendly interface and a robust backend to help you find GitHub repositories with ease and style. Built on the lightweight yet powerful Roda framework, it ensures speed, security, and scalability. Whether you're looking to explore new repositories or find specific ones, this app has got you covered!

## Installation 🔧

Setting up and running the app is as simple as 1, 2, 3! Follow the steps below to get it up and running on your local machine:

### 1. Clone the Repository 📦

Clone the repository to your local machine. Open your terminal and run:

```bash
git clone https://github.com/RomaShKeee/github-search-app.git
cd github-search-app
```


### 2. Install Dependencies 🧰
Ensure you have Ruby installed on your machine. You can check this by running ruby -v. If Ruby is not installed, follow the official Ruby installation guide.

Now, install the required gems and dependencies:

```bash
bundle install
```
### 3. Start the Application 🔥
Start the application using the following command:

```bash
rackup -s Puma
```
Your application will be running on http://localhost:9292. Open this URL in a browser, and you’re all set to start exploring the amazing world of GitHub repositories!

### Running Tests ✅
I've use Minitest for testing, coupled with VCR for recording and replaying API calls to ensure fast and deterministic tests. To run all tests, simply execute:

```bash
rake
```
Ensure all tests pass before making changes to the codebase or pushing to production.
