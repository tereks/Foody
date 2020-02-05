//
//  ErrorDisplay.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit

protocol ErrorDisplay {

    func showError(_ error: Error)

    func showError(_ message: String)
}

extension ErrorDisplay {

    func showError(_ error: Error) {
    }

    func showError(_ message: String) {
    }
}

extension ErrorDisplay where Self: UIViewController {

    func showError(_ error: Error) {
        showError(error.localizedDescription)
    }

    func showError(_ message: String) {
        let title = "Error"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)

        self.present(alert, animated: true, completion: nil)
    }
}
