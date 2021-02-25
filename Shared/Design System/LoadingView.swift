//
//  LoadingView.swift
//  Ravn-Challenge-V2 (iOS)
//
//  Created by emartinez on 2/24/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack(spacing: 8) {
            ProgressView()
                .frame(width: 24, height: 24, alignment: .center)
            HeaderTextView(type: .lowEmphasis, value: Translations.loadingText)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
