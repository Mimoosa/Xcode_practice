//
//  MemberDetails.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 13.4.2026.
//

import SwiftUI
import SwiftData

struct MemberDetails: View {
    @Environment(\.modelContext) private var modelContext
    @Query var members: [ParliamentMemberModel]
    @Query var assessments: [AssessmentModel]
    @State private var assessmentNote = ""
    @State private var indicator: Int = 0
    
    let personNumber: Int
    
    let party: String
    
    init(personNumber: Int, party: String) {
            self.personNumber = personNumber
            self.party = party

            // Dynamic query for assessments
            self._assessments = Query(
                filter: #Predicate { $0.member.personNumber == personNumber }
            )

            // Dynamic query for members
            self._members = Query(
                filter: #Predicate { $0.personNumber == personNumber }
            )
        }
    
    var member: ParliamentMemberModel? {
        members.first{ $0.personNumber == personNumber }
    }
    
    var body: some View {
        ScrollView {
            if let member = member {
                
                let currentYear = Calendar.current.component(.year, from: Date())
                let ageThisYear = currentYear - member.bornYear
                
                VStack {
                    VStack(spacing: 24) {
                        
                        
                        AsyncImage(url: URL(string: member.imgUrl)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                
                            case .failure:
                                // custom placeholder
                                Image(systemName: "person.crop.rectangle")
                                    .resizable()
                                    .scaledToFit()
                                    .font(.system(size: 40, weight: .thin))
                                    .foregroundColor(.gray)
                                
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 6)
                        .padding(.horizontal)
                        
                        
                        Text("Name: ")
                            .font(.largeTitle.bold())
                            .padding(.top, 8)
                        
                        Text("\(member.first) \(member.last)")
                            .font(.largeTitle.bold())
                            .padding(.top, 8)
                        
                        Text("Minister: \(member.minister ? "Yes" : "No")")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                        
                        Text("Constituency: \(member.constituency)")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                        
                        Text("Seat Number: \(member.seatNumber)")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                        
                        Text("Age: \(ageThisYear)")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                        
                        if let twitter = member.twitter, !twitter.isEmpty {
                            Text("Twitter: \(twitter)")
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.top, 8)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                    
                    VStack(alignment: .center, spacing: 16) {
                        Spacer()
                            .frame(height: 20)
                        
                        TextField("Add your note about this politician", text: $assessmentNote)
                            .textFieldStyle(.roundedBorder)
                        
                        HStack {
                            Spacer()

                            Button {
                                onClick(+1)
                            } label: {
                                Image(systemName: "hand.thumbsup.fill")
                                    .foregroundColor(indicator == 1 ? .green : .gray)
                                    .font(.title2)
                            }

                            Button {
                                onClick(-1)
                            } label: {
                                Image(systemName: "hand.thumbsdown.fill")
                                    .foregroundColor(indicator == -1 ? .red : .gray)
                                    .font(.title2)
                            }
                        }
                        .padding(.horizontal, 20)
                        
                        Button{
                            let newAssessment = AssessmentModel(
                                    member: member,
                                    indicator: indicator,
                                    comment: assessmentNote
                                )
                                modelContext.insert(newAssessment)

                                // Reset UI state
                                assessmentNote = ""
                                indicator = 0
                            
                        } label: {
                            Text("Save")
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .background(Color.black)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                        }
                        ForEach(assessments.sorted(by: {$0.timestamp > $1.timestamp})){ assessment in
                            AssessmentRow(assessment: assessment)
                        }
                        
                    } .padding(.horizontal, 20)
                }
                
            } else {
                Text("Member not found")
                    .foregroundColor(.red)
                    .font(.title2)
            }
        }
        .navigationTitle("Member Details (\(party.uppercased()))")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func onClick(_ value: Int) {
            indicator = value
        }
}


#Preview {
    MemberDetails(personNumber: 123, party: "sok")
}
