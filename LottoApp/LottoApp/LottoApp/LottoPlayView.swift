//
//  LottoPlayView.swift
//  LottoApp
//
//  Created by Monami Kirjavainen on 20.4.2026.
//

import SwiftUI

struct LottoPlayView: View {
    @State private var myLotto = Lotto()
    @State private var selectedNumbers: [Int] = []
    @State private var numbersToBeSelected = Array(1...40)
    @State private var result : Int? = nil
    
    let columns = Array(repeating: GridItem(.flexible()), count: 5)
    
    
    var body: some View {
        VStack(spacing: 24){
            Text("Choose 7 numbers from 1 to 40")
                                .font(.subheadline)
            
            // selectedNumbers
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(selectedNumbers, id: \.self) { number in
                        Button{
                            selectedNumbers.removeAll { $0 == number }
                            numbersToBeSelected.append(number)
                            numbersToBeSelected.sort()
                            
                        }label: {
                            Text("\(number)")
                                .font(.headline)
                                .foregroundColor(.yellow)
                                .frame(width: 44, height: 44)
                                .background(Color.gray.opacity(0.15))
                                .clipShape(Circle())

                        }
                    }
                }
                .padding(.horizontal)
            }
            
            // Play button
            if result == nil {
                Button {
                    result = myLotto.checkHowManyNumbersMatched(selectedNumbers)
                } label: {
                    Text("Play")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(
                            selectedNumbers.count == 7
                            ? Color.yellow
                            : Color.gray.opacity(0.4)
                        )
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                .disabled(selectedNumbers.count != 7)
            }
            
            // Reset button
            if result != nil {
                Button{
                    selectedNumbers = []
                    numbersToBeSelected = Array(1...40)
                    result = nil
                }label: {
                    Text("reset")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(Color.yellow)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
            
            // Number grid
            LazyVGrid(columns: columns, spacing: 16){
                ForEach(numbersToBeSelected, id: \.self){number in
                    Button{
                        if selectedNumbers.count < 7 {
                            selectedNumbers.append(number)
                            numbersToBeSelected.removeAll{$0 == number}
                        }
                    }label:{
                        Text("\(number)")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(width: 44, height: 44)
                            .background(Color.gray.opacity(0.15))
                            .clipShape(Circle())

                    }
                    
                }
            }
            
            // Result
             if result != nil {
                 Text("You matched \(result!) numbers!")
                     .font(.title3.bold())
                     .padding()
                     .frame(maxWidth: .infinity)
                     .background(Color.yellow.opacity(0.3))
                     .cornerRadius(12)
                     .padding(.horizontal)
            }
            
        }
    }
}

#Preview {
    LottoPlayView()
}
