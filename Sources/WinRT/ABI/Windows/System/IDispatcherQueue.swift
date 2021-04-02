// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

@_transparent
private var IID___x_ABI_CWindows_CSystem_CIDispatcherQueue: IID {
  IID(Data1: 0x603e88e4, Data2: 0xa338, Data3: 0x4ffe,
      Data4: (0xa4, 0x57, 0xa5, 0xcf, 0xb9, 0xce, 0xb8, 0x99))
}

public class IDispatcherQueue: IInspectable {
  override open class var IID: IID { IID___x_ABI_CWindows_CSystem_CIDispatcherQueue }

  public func CreateTimer(_ result: UnsafeMutablePointer<UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CIDispatcherQueueTimer>?>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIDispatcherQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.CreateTimer(pThis, result))
    }
  }

  public func TryEnqueue(_ callback: UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CIDispatcherQueueHandler>?, _ result: UnsafeMutablePointer<boolean>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIDispatcherQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.TryEnqueue(pThis, callback, result))
    }
  }

  public func TryEnqueueWithPriority(_ priority: __x_ABI_CWindows_CSystem_CDispatcherQueuePriority, _ callback: UnsafeMutablePointer<__x_ABI_CWindows_CSystem_CIDispatcherQueueHandler>?, _ result: UnsafeMutablePointer<boolean>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIDispatcherQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.TryEnqueueWithPriority(pThis, priority, callback, result))
    }
  }

  public func add_ShutdownStarting(_ handler: UnsafeMutablePointer<__FITypedEventHandler_2_Windows__CSystem__CDispatcherQueue_Windows__CSystem__CDispatcherQueueShutdownStartingEventArgs>?, _ token: UnsafeMutablePointer<EventRegistrationToken>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIDispatcherQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.add_ShutdownStarting(pThis, handler, token))
    }
  }

  public func remove_ShutdownStarting(_ token: EventRegistrationToken) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIDispatcherQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.remove_ShutdownStarting(pThis, token))
    }
  }

  public func add_ShutdownCompleted(_ handler: UnsafeMutablePointer<__FITypedEventHandler_2_Windows__CSystem__CDispatcherQueue_IInspectable>?, _ token: UnsafeMutablePointer<EventRegistrationToken>?) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIDispatcherQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.add_ShutdownCompleted(pThis, handler, token))
    }
  }

  public func remove_ShutdownCompleted(_ token: EventRegistrationToken) throws {
    return try perform(as: __x_ABI_CWindows_CSystem_CIDispatcherQueue.self) { pThis in
      try CHECKED(pThis.pointee.lpVtbl.pointee.remove_ShutdownCompleted(pThis, token))
    }
  }
}
