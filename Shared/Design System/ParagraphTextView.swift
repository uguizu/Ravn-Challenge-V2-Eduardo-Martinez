//
//  ParagraphTextView.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/24/21.
//

import SwiftUI

enum ParagraphTextViewType {
    case regular
    case lowEmphasis
    
    var color: Color {
        switch self {
        case .regular:
            return .textDark
        case .lowEmphasis:
            return .textLight
        }
    }
}

struct ParagraphTextView: View {
    
    let type: ParagraphTextViewType
    let value: String
    
    var body: some View {
        Text(value)
            .font(.fontParagraph)
            .foregroundColor(type.color)
    }
}
