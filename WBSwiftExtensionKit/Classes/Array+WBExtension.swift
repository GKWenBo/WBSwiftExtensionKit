//
//  Array+WBExtension.swift
//  Pods
//
//  Created by 文波 on 2019/12/17.
//


public extension Array {
    
    /// Insert an element at the beginning of array.
    /// [2, 3, 4, 5].prepend(1) -> [1, 2, 3, 4, 5]
    /// ["e", "l", "l", "o"].prepend("h") -> ["h", "e", "l", "l", "o"]
    /// - Parameter newElement: element to insert.
    mutating func prepend(_ newElement: Element) {
        insert(newElement, at: 0)
    }
    
    /// Safely swap values at given index positions.
    ///
    ///        [1, 2, 3, 4, 5].safeSwap(from: 3, to: 0) -> [4, 2, 3, 1, 5]
    ///        ["h", "e", "l", "l", "o"].safeSwap(from: 1, to: 0) -> ["e", "h", "l", "l", "o"]
    /// - Parameters:
    ///   - index: index of first element.
    ///   - otherIndex: index of other element.
    mutating func wb_safeSwap(from index: Index, to otherIndex: Index) {
        guard index != otherIndex else { return }
        guard startIndex..<endIndex ~= index else { return }
        guard startIndex..<endIndex ~= otherIndex else { return }
        swapAt(index, otherIndex)
    }
}

public extension Array where Element: Equatable {
    
    /// Remove all instances of an item from array.
    ///        [1, 2, 2, 3, 4, 5].removeAll(2) -> [1, 3, 4, 5]
    ///        ["h", "e", "l", "l", "o"].removeAll("l") -> ["h", "e", "o"]
    /// - Parameter item: item to remove.
    @discardableResult
    mutating func wb_removeAll(_ item: Element) -> [Element] {
        removeAll(where: {$0 == item})
        return self
    }
    
    /// Remove all instances contained in items parameter from array.
    ///        [1, 2, 2, 3, 4, 5].removeAll([2,5]) -> [1, 3, 4]
    ///        ["h", "e", "l", "l", "o"].removeAll(["l", "h"]) -> ["e", "o"]
    /// - Parameter items: items to remove.
    @discardableResult
    mutating func wb_removeAll(_ items: [Element]) -> [Element] {
        guard !items.isEmpty else { return self }
        removeAll(where: { items.contains($0) })
        return self
    }
    
    /// Remove all duplicate elements from Array.
    ///        [1, 2, 2, 3, 4, 5].removeDuplicates() -> [1, 2, 3, 4, 5]
    ///        ["h", "e", "l", "l", "o"]. removeDuplicates() -> ["h", "e", "l", "o"]
    mutating func wb_removeDuplicates() -> [Element] {
        // Thanks to https://github.com/sairamkotha for improving the method
        self = reduce(into: [Element]()) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
        return self
    }
    
    /// Return array with all duplicate elements removed.
    ///     [1, 1, 2, 2, 3, 3, 3, 4, 5].withoutDuplicates() -> [1, 2, 3, 4, 5])
    ///     ["h", "e", "l", "l", "o"].withoutDuplicates() -> ["h", "e", "l", "o"])
    func wb_withoutDuplicates() -> [Element] {
        // Thanks to https://github.com/sairamkotha for improving the method
        return reduce(into: [Element]()) {
            if !$0.contains($1) {
                $0.append($1)
            }
        }
    }
    
    /// Returns an array with all duplicate elements removed using KeyPath to compare.
    /// - Parameter path: Key path to compare, the value must be Equatable.
    func wb_withoutDuplicates<E: Equatable>(keyPath path: KeyPath<Element, E>) -> [Element] {
        return reduce(into: [Element]()) { (result, element) in
            if !result.contains { $0[keyPath: path] == element[keyPath: path] } {
                result.append(element)
            }
        }
    }
    
    /// Returns an array with all duplicate elements removed using KeyPath to compare.
    /// - Parameter path: Key path to compare, the value must be Hashable.
    func wb_withoutDuplicates<E: Hashable>(keyPath path: KeyPath<Element, E>) -> [Element] {
        var set = Set<E>()
        return filter({ set.insert($0[keyPath: path]).inserted})
    }
}
