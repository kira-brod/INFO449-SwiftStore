//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
    
    func price() -> Int
}

class Item: SKU {
    var name: String
    var priceEach: Int
    var weight: Double
    
    
    
    init(name itemName: String, priceEach: Int, weight:Double = 0.0) {
        self.name = itemName
        self.priceEach = priceEach
        self.weight = weight
        
        if self.weight != 0 {
            self.priceEach = Int(self.weight * Double(priceEach))
        }
    }
    
    func price() -> Int {
        return priceEach
    }
}

class Receipt {
    var itemList: [Item] = []
    
    func items() -> [Item] {
        return itemList
    }
    
    func total() -> Int {
        var total = 0
        for item in itemList {
            total += item.priceEach
        }
        return total
    }
    
    func output() -> String {
        var itemsString : String = ""
        
        itemList.forEach { item in itemsString += "\n\(item.name): $\(item.priceEach/100).\(item.priceEach%100)"}
        
        return """
Receipt:\(itemsString)\n------------------\nTOTAL: $\(total()/100).\(total()%100)
"""
        
    }
}

class Register {
    var receipt: Receipt
    var subtotalInt: Int
    
    init(){
        self.receipt = Receipt()
        self.subtotalInt = 0
    }
    
    func scan(_ item: Item){
        receipt.itemList.append(item)
        subtotalInt += item.priceEach
    }
    
    func subtotal() -> Int {
        return subtotalInt
    }
    
    func total() -> Receipt {
        let receiptReturn = receipt
//        receipt.itemList.removeAll()
        return receiptReturn
        
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

