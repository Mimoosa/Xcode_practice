//
//  ConstituencyImageMapper.swift
//  ParliamentApp
//
//  Created by Monami Kirjavainen on 15.4.2026.
//  Student number: 2400479
//

import Foundation

// Returns the correct asset image name for a given constituency.
func imageName(for constituency: String) -> String {
    switch constituency {
    case "Helsinki": return "helsinki"
    case "Uusimaa": return "uusimaa"
    case "Häme": return "häme"
    case "Kaakkois-Suomi": return "kaakkois_suomi"
    case "Savo-Karjala": return "savo_karjala"
    case "Keski-Suomi": return "keski_suomi"
    case "Pirkanmaa": return "pirkanmaa"
    case "Satakunta": return "satakunta"
    case "Varsinais-Suomi": return "varsinais_suomi"
    case "Vaasa": return "vaasa"
    case "Oulu": return "oulu"
    case "Lappi": return "lappi"
    case "Ahvenanmaa": return "ahvenmaa"
    default: return "helsinki"
    }
}
