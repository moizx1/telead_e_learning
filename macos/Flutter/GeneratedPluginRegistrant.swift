//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import cloud_firestore
import firebase_auth
import firebase_core
import firebase_messaging
import firebase_storage
import package_info_plus
import smart_auth
import wakelock_plus

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FLTFirebaseFirestorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseFirestorePlugin"))
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  FLTFirebaseMessagingPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseMessagingPlugin"))
  FLTFirebaseStoragePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseStoragePlugin"))
  FLTPackageInfoPlusPlugin.register(with: registry.registrar(forPlugin: "FLTPackageInfoPlusPlugin"))
  SmartAuthPlugin.register(with: registry.registrar(forPlugin: "SmartAuthPlugin"))
  WakelockPlusMacosPlugin.register(with: registry.registrar(forPlugin: "WakelockPlusMacosPlugin"))
}
