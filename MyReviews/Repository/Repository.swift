//
//  Repository.swift
//  MyReviews
//
//  Created by Leonardo Gomes on 27/08/20.
//  Copyright © 2020 Leonardo Gomes. All rights reserved.
//

import Foundation
//
//protocol Repository: class {
//    
//    associatedtype Item: RepositoryItem
//    
//    var items: [Item] { get set }
//    
//    func createNewItem(newItem: Item)
//    func readAllItems() -> [Item]
//    func readItem(idItem: String) -> Item?
//    func updateItem(item: Item)
//    func deleteItem(idItem: String)
//    
//}
//
//
//extension Repository {
//    
//    func createNewItem(newItem: Item) {
//        
//        items.append(newItem)
//        if let data = try? JSONEncoder().encode(newItem) {
//            FileHelper().createFile(with: data, name: newItem.idItem)
//        }
//    }
//    
//    func readAllItems() -> [Item] {
//        let fileNames: [String] = FileHelper().contentsForDirectory(atPath: "")
//        
//        self.items = fileNames.compactMap { (fileName) -> Item? in
//            if let data = FileHelper().retrieveFile(at: fileName) {
//                let item = try? JSONDecoder().decode(Item.self, from: data)
//                return item
//            }
//            return nil
//        }
//
//        return items
//    }
//    
//    func readItem(idItem: String) -> Item? {
//        if let data = FileHelper().retrieveFile(at: idItem) {
//            let item = try? JSONDecoder().decode(Item.self, from: data)
//            return item
//        }
//        return nil
//    }
//    
//    func updateItem(item: Item) {
//        
//        if let data = try? JSONEncoder().encode(item) {
//            FileHelper().updateFile(at: item.idItem, data: data)
//        }
//    }
//    
//    func deleteItem(idItem: String) {
//        FileHelper().removeFile(at: idItem)
//    }
//}
