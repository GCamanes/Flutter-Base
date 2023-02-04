import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
    let controller = window.rootViewController as! FlutterViewController

    let flavorChannel = FlutterMethodChannel(
      name: "flavor",
      binaryMessenger: controller.binaryMessenger
    )

    flavorChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread
      let flavor = Bundle.main.infoDictionary?["App - flavor"]
      result(flavor)
    })

    let appValuesChannel = FlutterMethodChannel(
      name: "appValues",
      binaryMessenger: controller.binaryMessenger
    )

    appValuesChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread
      let dict = Bundle.main.infoDictionary?["App - values"] as AnyObject
      // Checking if value is found with the call.method
      guard let appValue = dict.object(forKey:call.method) else {
          result(FlutterMethodNotImplemented)
          return
      }
      result(appValue)
    })
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
