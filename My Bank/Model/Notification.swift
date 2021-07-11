//
//  Notification.swift
//  My Bank
//
//  Created by Mousa on 11.07.21.
//

import Foundation

struct NotificationModel: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var detail: String
    var date: String
}
