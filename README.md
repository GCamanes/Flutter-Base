# flutter_base

Flutter base for any Flutter project.

## Getting Started

This project has 2 apps (white label friendly) with 2 flavors each:

- dev - prod - devbis - prodbis

To launch the project run the following

```
flutter run --flavor dev
flutter run --flavor prod
```

## Flavor doc

Links used to add app and flavors to project

- https://blog.svenadolph.net/flutter-flavors-and-ios-schemes/
- https://www.chwe.at/2020/10/flutter-flavors/
- for icons : https://dev.to/stack-labs/flutter-flavors-launcher-icons-made-simple-336j

On Android we used kotlin flavors and on iOS we used schemes and targets.

### Adding new app

Here we presents all steps to add a new working app to the project.

#### Android side

Go to ```android/app/build.gradle``` and add flavors of the new app below existing ones like :

```
devbisbis {
    dimension "app"
    applicationId "com.example.flutterbasebisbis"
    applicationIdSuffix ".dev"
    versionNameSuffix "-dev"
    resValue "string", "app_name", "Flavor3 Dev"
}

prodbisbis {
    dimension "app"
    applicationId "com.example.flutterbasebisbis"
    resValue "string", "app_name", "Flavor3"
}
```

#### iOS side

Here it's more complicated as we need to follow more steps.

1) Edit the Podfile (ios folder) to add the target of the new app (needed for pods) below existing
   targets. Add the following lines:

```
target 'RunnerBisBis' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end
```

2) in Xcode, add a new target by duplicating an existing ones (ie RunnerBisBis) (we will edit it
   latter)

3) in Xcode, go to the Flutter folder and duplicate ```xconfig``` files to have the following:

```
Debug-devbisbis.xcconfig
Debug-prodbisbis.xcconfig
Release-devbisbis.xcconfig
Release-prodbisbis.xcconfig
```

Edit the content of the file to match what you want (app name only currently and dev bundle suffix).
Config file names have to match the name of the flavor to allow Flutter to access it correctly.
Ensure that these new files are linked to the new target.

4) in Xcode, select ```Runner``` project, in PROJECT select again ```Runner``` and select ```Info```
   tab. No you can duplicate existing```Configurations``` to create 6 new configurations as
   following:

```
Debug-devbisbis
Debug-prodbisbis
Release-devbisbis
Release-prodbisbis
Profile-devbisbis
Profile-prodbisbis
```

Now ensure that for each new configuration, each target is linked to the correct xconfig as
following:
<img src="./assets/readme/runner-configs-targets.png" width="500" height="466"/>

5) Now we need to edit schemes. Rename the scheme linked to the new target as ```prodbisbis``` (or
   another one according to what you selected before for prod flavor). Ensure that the scheme is
   linked to the correct target and and correct configurations

<img src="./assets/readme/runner-configs-targets.png" width="624" height="193"/>

6) Now duplicate the previous scheme to create the dev scheme of the app and named
   it ```devbisbis``` (or another one according to what you selected before for prod flavor)
   Ensure again that the scheme in linked correctly to target and configs

<img src="./assets/readme/runner-configs-targets-dev.png" width="624" height="193"/>

7) Now you can edit the bundle id of the new app. In Xcode, select ```Runner``` project, in TARGETS
   select the new target and select ```Build Settings```tab. Do a research of ```bundle```
   In ```Packaging``` open ```Product Bundle Identifier``` and edit the value for each
   configuration.