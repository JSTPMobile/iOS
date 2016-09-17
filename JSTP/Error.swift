//
//  Errors.swift
//  JSTP
//
//  Created by Andrew Visotskyy on 7/25/16.
//  Copyright © 2016 Andrew Visotskyy. All rights reserved.
//

import Foundation

internal extension NSError {
   
   fileprivate convenience init(_ code: Int, _ description: String) {
      
      let domain = Bundle.main.bundleIdentifier!
      let info   = [NSLocalizedDescriptionKey:description]
      
      self.init(domain: domain, code: code, userInfo: info)
   }
   
   internal func raw() -> AnyObject {
         
      let error =  [
         "message":self.localizedDescription,
         "code"   :self.code
      ] as [String : Any]
         
      return error as AnyObject
   }
   
}

open class Errors {
   
   open static let InterfaceIncompatible = NSError(13, "Incompatible interface")
   open static let ApplicationNotFound   = NSError(10, "Application not found" )
   open static let AuthorizationFailed   = NSError(11, "Authentication failed" )
   open static let InterfaceNotFound     = NSError(12, "Interface not found"   )
   open static let MethodNotFound        = NSError(14, "Method not found"      )
}

