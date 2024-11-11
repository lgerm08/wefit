//
//  LoadingHomeView.swift
//  we movies
//
//  Created by Rafael Teixeira Martins on 10/11/24.
//

import SwiftUI

struct LoadingHomeView: View {
    
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .controlSize(.large)
            .tint(Color.secondaryColor)
    }
}
