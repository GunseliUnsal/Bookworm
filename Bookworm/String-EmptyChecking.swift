//
//  String-EmptyChecking.swift
//  Bookworm
//
//  Created by Günseli Ünsal on 5.08.2024.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
