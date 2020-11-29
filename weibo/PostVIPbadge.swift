//
//  PostVIPbadge.swift
//  weibo
//
//  Created by 梁家伟 on 2020/11/27.
//

import SwiftUI

struct PostVIPbadge: View {
    let vip: Bool
    
    var body: some View {
        Group{
            if vip{
                Text("V")
                    .bold()
                    .font(.system(size: 11))
                    .frame(width: 15, height: 15)
                    .foregroundColor(.yellow)
                    .background(Color.red)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(Color.white, lineWidth: 1)
                    )
            }
        }
    }
}

struct PostVIPbadge_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostVIPbadge(vip: true)
        }
    }
}
