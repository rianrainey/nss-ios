import UIKit

// Solution 1
// Create a random list and then use built-in sort
func createRandomList (quantity: Int, min: Int, max: Int) -> [Int]{
    var list = [Int]()
    for i in 0..<quantity{
        list.append(Int(arc4random_uniform(UInt32(max))))
    }
    return list
}
var randomList = createRandomList(3, 0, 10)

randomList.sort { $0 < $1 }
println(randomList)
randomList.sort { $0 > $1 }
println(randomList)

// Solution 2
// Abstract sort directions into separate methods
func sortAsc (list: [Int]) -> [Int] {
    var newList = list
    newList.sort { $0 < $1 }
    //return newList.sort { $0 < $1 } // Can't do this :(
    return newList
}

func sortDesc (list: [Int]) -> [Int] {
    var newList = list
    newList.sort { $0 > $1 }
    return newList
}

var list2 = createRandomList(5, 10, 20)
sortAsc(list2)
sortDesc(list2)

// Solution 3
// Do everything within one method
func createRandomSortedList(direction: NSString, quantity: Int, min: Int, max: Int) -> [Int] {
    var list = [Int]()
    for i in 0..<quantity {
        list.append(Int(arc4random_uniform(UInt32(max))))
    }
    
    if direction == "asc" {
        list.sort { $0 < $1 }
    } else if direction == "desc" {
        list.sort { $0 > $1 }
    }
    
    return list
}

var list3 = createRandomSortedList("asc", 3, 0, 10)
var list4 = createRandomSortedList("desc", 5, 0, 10)

// Solution 4 
// Extend NSArray and add my methods to NSArray class
// list = createRandomList(3, 0, 10)
// Example: list.sortAsc

//extension NSMutableArray {
//    func helloWorld() -> String {
//        return "Hello World"
//    }
//    
//    func sortAsc (list: [Int]) -> [Int] {
//        self.sort { $0 < $1 }
//        //return newList.sort { $0 < $1 } // Can't do this :(
//        return self
//    }
//    
//    func sortDesc (list: [Int]) -> [Int] {
//        var newList = list
//        newList.sort { $0 > $1 }
//        return newList
//    }
//    
//    
//}
//
//var foo = []:NSMutableArray
//foo.helloWorld()
//var list5 = createRandomList(4, 50, 100)
//list5.sortAsc()


// Solution 5
// Return tuple from one closure

// Questions
// How to read Swift documentation? How to make sure paramter conforms to a certain protocol
