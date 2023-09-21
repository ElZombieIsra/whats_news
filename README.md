# Whats news

A simple application to read worldwide news

## Pre-requisites

1. Install the correct version of Flutter to run the app
   1. Install [fvm](https://fvm.app/) and run `fmv install` in the project folder or
   2. Install flutter version `3.13.2`
2. Run `flutter doctor` to confirm everything it's installed correctly
3. Run `flutter packages get` to install the project dependencies

## How to run

1. Clone the repo `git clone https://github.com/ElZombieIsra/whats_news.git`
2. Rename the file `.env.template` to `.env`
3. Paste your API Key for [newsapi.org](https://newsapi.org) on the file `.env` on the `NEWS_API_KEY=` row
4. Run the app using `flutter run`

## How to test

1. Run the tests using `flutter test`
2. Verify there's a message `All tests passed!` at the end of the execution
