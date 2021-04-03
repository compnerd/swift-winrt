// Copyright © 2021 Saleem Abdulrasool <compnerd@compnerd.org>
// SPDX-License-Identifier: BSD-3

import CWinRT

extension AsyncActionCompletedHandler {
  fileprivate static func from(_ pUnk: UnsafeMutableRawPointer?) -> Unmanaged<AsyncActionCompletedHandler>? {
    return pUnk?.bindMemory(to: AsyncActionCompletedHandler.WithTrailingObjects.self, capacity: 1).pointee.wrapper
  }
}

private var vtable: __x_ABI_CWindows_CFoundation_CIAsyncActionCompletedHandlerVtbl = .init(
  // MARK - IUnknown Methods
  QueryInterface: {
    guard let pUnk = $0, let riid = $1, let ppvObject = $2 else {
      return E_INVALIDARG
    }

    switch riid.pointee {
    case IUnknown.IID, IAsyncActionCompletedHandler.IID:
      _ = pUnk.pointee.lpVtbl.pointee.AddRef(pUnk)
      ppvObject.pointee = UnsafeMutableRawPointer(pUnk)
      return S_OK

    default:
      ppvObject.pointee = nil
      return E_NOINTERFACE
    }
  },
  AddRef: {
    let instance = AsyncActionCompletedHandler.from($0)
    _ = instance?.retain()
    return ULONG(_getRetainCount(instance!.takeUnretainedValue()))
  },
  Release: {
    let instance = AsyncActionCompletedHandler.from($0)
    return ULONG(_getRetainCount(instance!.takeRetainedValue()))
  },

  // MARK - IAsyncActionCompletedHandler Methods
  Invoke: {
    guard let self = AsyncActionCompletedHandler.from($0)?.takeUnretainedValue() else {
      return E_INVALIDARG
    }
    return self.Invoke(IAsyncAction($1), $2)
  }
)

open class AsyncActionCompletedHandler {
  internal struct WithTrailingObjects {
    public var `super`: __x_ABI_CWindows_CFoundation_CIAsyncActionCompletedHandler
    public var wrapper: Unmanaged<AsyncActionCompletedHandler>?
  }
  internal var instance: WithTrailingObjects

  public init() {
    self.instance = WithTrailingObjects(super: __x_ABI_CWindows_CFoundation_CIAsyncActionCompletedHandler(lpVtbl: &vtable), wrapper: nil)
    self.instance.wrapper = Unmanaged<AsyncActionCompletedHandler>.passUnretained(self)
  }

  open func Invoke(_ asyncInfo: IAsyncAction?, _ asyncStatus: AsyncStatus) -> HRESULT {
    return S_OK
  }
}

internal func Interface(_ instance: AsyncActionCompletedHandler)
    -> IAsyncActionCompletedHandler {
  return withUnsafeMutablePointer(to: &instance.instance.super) {
    IAsyncActionCompletedHandler(UnsafeMutableRawPointer($0))
  }
}
