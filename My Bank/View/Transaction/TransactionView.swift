//
//  TransactionView.swift
//  My Bank
//
//  Created by Mousa on 22.06.21.
//

import SwiftUI

struct TransactionCell: View {
    var transaction: Transaction
    
    var body: some View {
        HStack {
            Image("")
                .resizable()
                .frame(width: 50, height: 50)
                .padding([.top, .bottom], 15)
                .background(Color(Assets.Colors.accent))
                .clipShape(Circle())
                .shadow(radius: 10)
            
            VStack(alignment: .leading) {
                Text(transaction.name)
                    .font(.title3)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Text(transaction.type.rawValue)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            if transaction.type == .recieved {
                Text(String(format: "%.2f €", transaction.amount))
                    .font(.bold(.headline)())
                    .foregroundColor(Color(Assets.Colors.accent))
            }else {
                Text(String(format: "%.2f €", transaction.amount))
                    .font(.bold(.headline)())
                    .foregroundColor(Color(Assets.Colors.accentRed))
            }
                
        }
    }
}

struct TransactionView: View {
    
    let viewModel = TransactionViewModel()
    
        var body: some View {
            
            VStack {
              HStack {
                Text("History")
                    .foregroundColor(Color(Assets.Colors.accent))
                    .padding([.leading, .top], 44)
                    .font(.bold(.largeTitle)())
                Spacer()
              }
              .padding(.bottom, 44)
                
                ForEach(viewModel.transactions) { transaction in
                    TransactionCell(transaction: transaction)
                        .padding([.leading, .trailing], 44)
                }
                .background(Color.clear)
              Spacer()
            }
            .background(SwiftUI.Color(Assets.Colors.background).edgesIgnoringSafeArea(.all))
        }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
    }
}
