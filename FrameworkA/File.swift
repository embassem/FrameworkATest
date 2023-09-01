// Created on 01.09.23. Copyright © 2023 Delivery Hero SE. All rights reserved.
import Foundation
import UIKit

let version = "11.0.0"

protocol FrameworkAProtocol {
  func execute(path:String, onSuccess: @escaping (UIImage) -> Void)
}

extension FrameworkAProtocol {

  func execute(onSuccess: @escaping (UIImage) -> Void) {
    execute(path: "", onSuccess: onSuccess)
  }
}


class FrameworkAImp: FrameworkAProtocol {
  func execute(path:String, onSuccess: @escaping (UIImage) -> Void) {
    let url = URL(string: "https://bit.ly/2LMtByx")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let data = data,
         let image = UIImage(data: data){
        onSuccess(image)
      } else if let error = error {
        print("HTTP Request Failed \(error)")
      }
    }
  }
}
