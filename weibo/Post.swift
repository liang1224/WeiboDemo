//
//  Post.swift
//  weibo
//
//  Created by 梁家伟 on 2020/11/27.
//

import SwiftUI

struct PostList: Codable{
    var list: [Post]
}

// Model
struct Post: Codable, Identifiable {
    let id: Int
    let avatar: String
    let vip: Bool
    let name: String
    let date: String
    
    var isFollowed: Bool
    
    let text: String
    let images:[String]
    
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

extension Post {
    var commentCountText: String {
        if commentCount == 0 { return "评论" }
        if commentCount < 1000 { return "\(commentCount)" }
        return String(format: "%.1fK", Double(commentCount) / 1000)
    }
    
    var likeCountText: String {
        if likeCount == 0 { return "点赞" }
        if likeCount < 1000 { return "\(likeCount)" }
        return String(format: "%.1fK", Double(likeCount) / 1000)
    }
    
    var avatarImage: Image {
        return loadImage(name: avatar)
    }
}

let postList = loadPostListDate("PostListData_hot_1.json")

func loadPostListDate(_ fileName: String) -> PostList {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Can't find file: \(fileName) in main Bundle")
    }
    
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can't load: \(fileName)")
    }
    
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Can't parse json data from: \(fileName)")
    }
    
    return list
}

func loadImage(name: String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}
