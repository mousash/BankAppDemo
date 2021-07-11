//
//  Notifications.swift
//  My Bank
//
//  Created by Mousa on 11.07.21.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let viewModel = NotificationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Notifications")
                        .foregroundColor(Color(Assets.Colors.accent))
                        .padding(.leading, 20)
                        .padding(.top, -44)
                        .font(.bold(.title)())
                    Spacer()
                }
                .padding(.bottom, 12)
                
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(notification: notification)
                }
                .background(Color.clear)
                Spacer()
            }
            .background(SwiftUI.Color(Assets.Colors.background).edgesIgnoringSafeArea(.all))
            .toolbar {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("close")
                }
            }
        }
    }
}

struct NotificationCell: View {
    var notification: NotificationModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(notification.title)
                    .foregroundColor(Color(Assets.Colors.accent))
                    .padding([.top, .leading], 16)
                
                VStack {
                    Text(notification.detail)
                        .foregroundColor(Color(Assets.Colors.light))
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                        .padding(.leading, -22)
                    
                        Text(notification.date)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(Color(Assets.Colors.light))
                            .padding([.bottom, .trailing], 8)
                    
                }
                .background(Color(Assets.Colors.background))
                .cornerRadius(10)
                .padding([.leading, .trailing], 16)
                .padding(.bottom, 8)
                
            }
            .background(Color(Assets.Colors.darkBackground))
            .cornerRadius(10)
            .padding([.leading, .trailing], 16)
            .padding(.bottom, 8)
        }
        
        
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
