//
//  UIImageView+Extensions.swift
//  RickAndMorty
//
//  Created by ozlem on 26.04.2023.
//

import UIKit

extension UIImageView {
    func set(_ urlString: String?) {
        guard let urlString,
              let url = URL(string: urlString)
        else { return }
        self.af.setImage(withURL : url)
    }
}
