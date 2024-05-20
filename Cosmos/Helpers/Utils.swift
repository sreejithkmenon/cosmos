//
//  Utils.swift
//  Cosmos
//
//  Created by Sreejith K Menon on 20/05/24.
//

import Foundation

/// This extension adds utility functions to any type that conforms to `StringProtocol`.
/// These utilities are designed to simplify common string manipulation tasks.
extension StringProtocol {
    
    /// Computes a version of the string where the first character is uppercased and the rest of the string remains unchanged.
    /// This is useful for cases where you need to ensure the first letter is capitalized but want to preserve the case of other letters.
    ///
    /// Example:
    /// ```swift
    /// let sample = "hello World"
    /// print(sample.firstUppercased) // Prints "Hello World"
    /// ```
    ///
    /// - Returns: A new string where only the first character is uppercased.
    var firstUppercased: String {
        // Using `prefix(1).uppercased()` ensures that we correctly handle strings
        // where the first character might be part of a multi-byte Unicode scalar,
        // which could be misrepresented if treated as a simple `Character` array.
        prefix(1).uppercased() + dropFirst()
    }
    
    /// Computes a version of the string where the first character is capitalized according to the current locale and the rest of the string remains unchanged.
    /// This method is similar to `firstUppercased` but uses `capitalized` which respects the current locale.
    ///
    /// Example:
    /// ```swift
    /// let sample = "hello world"
    /// print(sample.firstCapitalized) // Prints "Hello world"
    /// ```
    ///
    /// - Returns: A new string where only the first character is capitalized according to the current locale.
    var firstCapitalized: String {
        // The use of `capitalized` here respects the current locale's rules for capitalization,
        // which is important for proper noun capitalization in some languages.
        // `dropFirst()` is used to retain the original casing of the remainder of the string.
        prefix(1).capitalized + dropFirst()
    }
}
