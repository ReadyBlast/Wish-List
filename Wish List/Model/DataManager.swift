//
//  DataManager.swift
//  Wish List
//
//  Created by XE on 06.12.2023.
//

import Foundation

final class DataManager {
    static let instance = DataManager()
    private init() {
        generateMockWishes()
    }
    
    private(set) var wishes: [Wish] = []
    private(set) var wishesHistory: [Wish] = []
    
    private func generateMockWishes() {
        let jacketWish = Wish(name: "Buy a jacket", description: "Jacket must be a Versace JC")
        let carWish = Wish(name: "Buy a Rolls Royce", description: "Cullinan with Aquamarine Color")
        let travelWish = Wish(name: "Travel to Cuba", description: nil)
        wishes = [jacketWish, carWish, travelWish]
    }
    
    func addWish(_ wish: Wish) {
        wishes.append(wish)
    }
    
    func removeWish(indexPathRow: Int) {
        wishes.remove(at: indexPathRow)
    }
    
    func removeFromHistory(index: Int) {
        wishesHistory.remove(at: index)
    }
    
    func makeAsDone(wish: Wish, indexPathRow: Int) {
        DataManager.instance.removeWish(indexPathRow: indexPathRow)
        wishesHistory.insert(wish, at: 0)
    }
}
