//
//  ProgressBar.swift
//  tv
//
//  Created by Christoph Walcher on 12.04.20.
//  Copyright © 2020 Christoph Walcher. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    @State var currentProgress: CGFloat = 0.0
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.gray)
                .frame(width: 200, height: 6)
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(.blue)
                .frame(width: 200 * currentProgress, height: 6)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
