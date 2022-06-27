//
//  Extensions.swift
//  MovieFinalproject_318941309
//
//  Created by חן איפרגן on 24/05/2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter()-> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
