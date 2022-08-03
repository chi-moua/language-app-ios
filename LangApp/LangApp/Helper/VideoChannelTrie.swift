//
//  VideoChannelTrie.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 8/3/22.
//

import Foundation

// MARK: - VideoChannelTrie
class VideoChannelTrie {
    var root: TrieNode
    
    init() {
        root = TrieNode()
    }
    
    func insert(a channel: VideoSubscriptionCellModel) {
        var currentRoot = root
        channel.channelTitle.forEach { char in
            currentRoot = currentRoot.addLetter(char)
        }
        currentRoot.addChannel(channel)
    }
    
    func insert(all channels: [VideoSubscriptionCellModel]) {
        channels.forEach { channel in
            insert(a: channel)
        }
    }
    
    func search(_ query: String) -> [VideoSubscriptionCellModel] {
        var results = [VideoSubscriptionCellModel]()
        
        var currentRoot = root
        for char in query {
            if let nextNode = currentRoot.getChildren(with: char) {
                if currentRoot.channelCount > 0 {
                    results.append(contentsOf: currentRoot.relatedChannels)
                }
                currentRoot = nextNode
            } else {
                break
            }
        }
        return results
    }
}

// MARK: - TrieNode
class TrieNode {
    var children: [Character: TrieNode]
    var relatedChannels: [VideoSubscriptionCellModel]
    
    init() {
        children = [Character: TrieNode]()
        relatedChannels = []
    }
    
    func addLetter(_ letter: Character) -> TrieNode {
        if let node = children[letter] {
            return node
        } else {
            let newNode = TrieNode()
            children[letter] = newNode
            return newNode
        }
    }
    
    func getChildren(with letter: Character) -> TrieNode? {
        return children[letter]
    }
    
    func addChannel(_ channel: VideoSubscriptionCellModel) {
        relatedChannels.append(channel)
    }
    
    var channelCount: Int {
        return relatedChannels.count
    }
}
