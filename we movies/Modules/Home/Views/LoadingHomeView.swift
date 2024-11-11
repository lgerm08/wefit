//
//  LoadingHomeView.swift
//  we movies
//
//  Created by Lucas Germano on 10/11/24.
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
