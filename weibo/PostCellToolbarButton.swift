//
//  PostCellToolbarButton.swift
//  weibo
//
//  Created by 梁家伟 on 2020/11/29.
//

import SwiftUI

struct PostCellToolbarButton: View {
    let text: String
    let image: String
    let color: Color
    let action: () -> Void //closure 闭包
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size: 15))
            }
        }
        .foregroundColor(color)
        .buttonStyle(BorderlessButtonStyle())
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(text: "点赞", image: "heart", color: .red) {
            print("点赞")
        }
    }
}
