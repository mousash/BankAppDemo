//
//  Transaction.swift
//  My Bank
//
//  Created by Mousa on 23.06.21.
//

import Foundation

struct Transaction: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var type: TransactionEnum
    var amount: Double
}

enum TransactionEnum: String {
    case recieved = "Recieved"
    case sent = "Sent"
}
