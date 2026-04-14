//
//  AssessmentModel.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 14.4.2026.
//

import Foundation
import SwiftData

@Model
class AssessmentModel {
    @Relationship var member: ParliamentMemberModel
    var indicator: Int
    var comment: String
    var timestamp: Date

    init(member: ParliamentMemberModel, indicator: Int, comment: String) {
        self.member = member
        self.indicator = indicator
        self.comment = comment
        self.timestamp = Date()
    }
}

