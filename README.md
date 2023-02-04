# Flutter Base

This project aimed to be the base of any new Flutter porject.

Base is build on:
- flutter bloc
- clean architecture

You can run the app using this two commands:
```
flutter run --flavor dev
flutter run --flavor prod
```

## Getting Started

# Android history
There's a little bug starting with flutter ```3.7.1``` linked to android build, see [solution here](https://stackoverflow.com/a/75320787).

We needed to change gradle version from 7.5 to 7.6 in ```android/graddle/wrapper/gradle-wrapper.properties```.

## Flavors

This project consider two flavors running on both android ans iOS side: 
- dev
- prod

Each flavor is defined by its name and some customizable values:
- api url : to get api base url from native conf

# Android

1) Flavors declaration
The ```android/app/gradle``` was edited to add dev and prod flavors with their config values.

2) Channels
```MainActivity.kt``` was edited to add channels and method to retrieve value from native on Flutter side.

3) Application
```AndroidManifest.xml``` was edited to define app name according to selected flavor.