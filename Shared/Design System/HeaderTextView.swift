//
//  HeaderTextView.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/24/21.
//

import SwiftUI

enum HeaderTextViewType {
    case regular
    case lowEmphasis
    case highEmphasis
    
    var color: Color {
        switch self {
        case .regular:
            return .textDark
        case .lowEmphasis:
            return .textLight
        case .highEmphasis:
            return .textEmphasis
        }
    }
}

struct HeaderTextView: View {
    
    let type: HeaderTextViewType
    let value: String
    
    var body: some View {
        Text(value)
            .font(.fontHeader)
            .foregroundColor(type.color)
    }
}
