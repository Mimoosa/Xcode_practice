//
//  AssessmentRow.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 14.4.2026.
//  Student number: 2400479
//

import SwiftUI

struct AssessmentRow: View {
    let assessment: AssessmentModel

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {

                // Icon
                Image(systemName: assessment.indicator == 1
                      ? "hand.thumbsup.fill"
                      : "hand.thumbsdown.fill")
                    .foregroundColor(assessment.indicator == 1 ? .green : .red)
                    .font(.title2)
                    .padding(.top, 4)

                VStack(alignment: .leading, spacing: 6) {

                    // Comment text
                    Text(assessment.comment)
                        .font(.body)

                    // Positive / Negative label
                    Text(assessment.indicator == 1 ? "Positive feedback" : "Negative feedback")
                        .font(.caption)
                        .foregroundColor(.gray)

                    // Timestamp
                    Text(assessment.timestamp.formatted(date: .numeric, time: .shortened))
                        .font(.caption2)
                        .foregroundColor(.gray)
                }

                Spacer()
            }
            .padding(16)
        }
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 4)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

