//
//  HUDable.swift
//  FoodSearch
//
//  Created by Sergey Kim on 05.02.2020.
//  Copyright © 2020 Sergey Kim. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

public typealias HUD = NVActivityIndicatorView

public struct HUDConstants {

    public static let size = CGSize(width: 50, height: 35)
}

public protocol HUDable {

    func showHUD()

    func hideHUD()
}

public protocol HUDController: HUDable, NVActivityIndicatorViewable {

}

public protocol HUDView: class, HUDable {

    var hudView: HUD! { get set }

    func configureHUD()
}

public extension HUDController where Self: UIViewController {

    func showHUD() {
        let size = CGSize(width: 30, height: 30)
        self.startAnimating(size, type: .lineScale, color: .systemBlue)
    }

    func hideHUD() {
        self.stopAnimating(nil)
    }
}

public extension HUDView where Self: UIView {

    func configureHUD() {
        hudView = NVActivityIndicatorView(frame: .zero,
                                          type: .lineScale,
                                          color: .systemBlue)
        self.addSubview(hudView)

        hudView.centerInSuperview()
        hudView.size(HUDConstants.size)
    }

    func showHUD() {
        hudView.startAnimating()
    }

    func hideHUD() {
        hudView.stopAnimating()
    }
}
