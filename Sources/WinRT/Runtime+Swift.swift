// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

public func RoInitialize(_ type: RO_INIT_TYPE = RO_INIT_MULTITHREADED) throws {
  try CHECKED(RoInitialize(type))
}

public func RoGetActivationFactory<Factory: IInspectable>(_ activatableClassId: HString) throws -> Factory {
  var iid: IID = Factory.IID
  var factory: UnsafeMutableRawPointer?
  try CHECKED(RoGetActivationFactory(activatableClassId.hRef.hString, &iid, &factory))
  return Factory(pUnk: factory)
}

public func RoActivateInstance<Instance: IInspectable>(_ activatableClassId: HString) throws -> Instance {
  var instance: UnsafeMutablePointer<CWinRT.IInspectable>?
  try CHECKED(RoActivateInstance(activatableClassId.hRef.hString, &instance))
  return Instance(pUnk: instance)
}
