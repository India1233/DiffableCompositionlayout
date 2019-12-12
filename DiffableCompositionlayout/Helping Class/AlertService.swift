//
//  AlertService.swift
//  DiffableCompositionlayout
//
//  Created by Sachin Dumal on 12/12/19.
//  Copyright © 2019 Sachin Dumal. All rights reserved.
//

import UIKit

final class AlertService {
  static func createNetworkAlert(title: String, message:String, completion: @escaping () -> Void) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction     = UIAlertAction(title: "OK", style: .default) { _ in completion()}
        alertController.addAction(alertAction)
        return alertController
    }
}



