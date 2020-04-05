//
//  Character+WBExtension.swift
//  Pods
//
//  Created by 文波 on 2019/12/17.
//

// MARK: - Properties
public extension Character {
    
    /// Check if character is emoji.
    ///
    ///        Character("😀").isEmoji -> true
    ///
    var wb_isEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        let scalarValue = String(self).unicodeScalars.first!.value
        switch scalarValue {
        case 0x1F600...0x1F64F, // Emoticons
        0x1F300...0x1F5FF, // Misc Symbols and Pictographs
        0x1F680...0x1F6FF, // Transport and Map
        0x1F1E6...0x1F1FF, // Regional country flags
        0x2600...0x26FF, // Misc symbols
        0x2700...0x27BF, // Dingbats
        0xE0020...0xE007F, // Tags
        0xFE00...0xFE0F, // Variation Selectors
        0x1F900...0x1F9FF, // Supplemental Symbols and Pictographs
        127000...127600, // Various asian characters
        65024...65039, // Variation selector
        9100...9300, // Misc items
        8400...8447: // Combining Diacritical Marks for Symbols
            return true
        default:
            return false
        }
    }
    
    /// Integer from character (if applicable).
    ///
    ///        Character("1").int -> 1
    ///        Character("A").int -> nil
    ///
    var wb_int: Int? {
        return Int(String(self))
    }
    
    /// String from character.
    ///
    ///        Character("a").string -> "a"
    ///
    var wb_string: String {
        return String(self)
    }
    
    /// Return the character lowercased.
    ///
    ///        Character("A").lowercased -> Character("a")
    ///
    var wb_lowercased: Character {
        return String(self).lowercased().first!
    }
    
    /// Return the character uppercased.
    ///
    ///        Character("a").uppercased -> Character("A")
    ///
    var wb_uppercased: Character {
        return String(self).uppercased().first!
    }
}

// MARK: - Methods
public extension Character {
    
    /// Random character.
    ///
    ///    Character.random() -> k
    ///
    static func wb_randomAlphanumeric() -> Character {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".randomElement()!
    }
}

// MARK: - Operators
public extension Character {
    
    /// Repeat character multiple times.
    ///
    ///        Character("-") * 10 -> "----------"
    ///
    /// - Parameters:
    ///   - lhs: character to repeat.
    ///   - rhs: number of times to repeat character.
    static func * (lhs: Character, rhs: Int) -> String {
        guard rhs > 0 else { return "" }
        return String(repeating: String(lhs), count: rhs)
    }
    
    /// Repeat character multiple times.
    ///
    ///        10 * Character("-") -> "----------"
    ///
    /// - Parameters:
    ///   - lhs: number of times to repeat character.
    ///   - rhs: character to repeat.
    static func * (lhs: Int, rhs: Character) -> String {
        guard lhs > 0 else { return "" }
        return String(repeating: String(rhs), count: lhs)
    }
}
