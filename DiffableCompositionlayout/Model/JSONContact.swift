//
//  JSONContact.swift
//  DiffableCompositionlayout
//
//  Created by Sachin Dumal on 12/12/19.
//  Copyright © 2019 Sachin Dumal. All rights reserved.
//

import Foundation


struct JSONContact: Codable, Hashable {
    let id = UUID()
    let name: String
    let imageUrl: String
}
