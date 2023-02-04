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

## Android fix

There's a little bug starting with flutter ```3.7.1``` linked to android build, see [solution here](https://stackoverflow.com/a/75320787).

We needed to change gradle version from 7.5 to 7.6 in ```android/graddle/wrapper/gradle-wrapper.properties```.

## Flavors

This project consider two flavors running on both android ans iOS side: 
- ```dev```
- ```prod```

Each flavor is defined by its name and some customizable values:
- ```api url``` : to get api base url from native conf
- ```app name``` : to specify app display name
- ```bundle suffix``` : to differentiate dev and prod app

### Android

1) Flavors declaration
The ```android/app/build.gradle``` was edited to add dev and prod flavors with their config values.

2) Channels
```MainActivity.kt``` was edited to add channels and method to retrieve value from native on Flutter side.

3) Application
```AndroidManifest.xml``` was edited to define app name according to selected flavor.

### iOS

For iOS platform it's a bit more complex to add flavor because iOS works with schemes.

1) Create Release and Debug config files via Xcode in ```ios/Flutter```

2) Create configurations Debug/Release/Profile in Runner (Project part in Xcode)

<img src="./assets/readme/flavors_ios_runner_configurations.png" width="500" height="283"/>

3) Create dev and prod schemes that use linked configurations defined before

Don't forget to set scheme to shared and they must have the same name than flavors.

5) Check ```User-Defined``` values in ```Targets``` => ```Runner``` => ```Build Settings``` => ```User-defined```

Here you should see some values (```api_url```, ```app_name```, ```bundle_suffix```) based on configurations.

<img src="./assets/readme/flavors_ios_user_defined.png" width="500" height="283"/>

5) Add a ```User-Defined``` named ```app_flavor``` to store flavor value for each configurations

<img src="./assets/readme/flavors_ios_user_defined.png" width="500" height="283"/>

<img src="./assets/readme/flavors_ios_app_flavors_values" width="500" height="283"/>

6) Add entries to ```Info.plist``` in Xcode:
- ```App - values``` as a dictionary with key ```api_url``` linked to ```$(api_url)```
- ```App - flavor``` as a String with value ```$(api_flavor)```

<img src="./assets/readme/flavors_ios_info_plist.png" width="500" height="283"/>

7) Edit ```Bundle display name``` in ```Info.plist``` to value ```$(app_name)```

8) Channels
```AppDelegate.swift``` was edited to add channels and method to retrieve value from native on Flutter side.

9) Edit bundle suffix
- go to ```Targets``` => ```Runner``` => ```Build Settings``` => ```Packaging``` => ```Product Bundle Identifier```
- set general value to ```com.your.bundle(bundle_suffix)```
- you'll see that each configuration as the bundle suffix if defined before

<img src="./assets/readme/flavors_ios_bundle_identifier.png" width="500" height="283"/>

