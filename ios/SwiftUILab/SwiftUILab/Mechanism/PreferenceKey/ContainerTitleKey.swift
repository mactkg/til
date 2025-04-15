//
//  ContainerTitleKey.swift
//  SwiftUILab
//
//  Created by 原　健太 on 2025/04/14.
//

@preconcurrency
import Foundation
import SwiftUI

struct ContainerTitleKey: PreferenceKey {
    static var defaultValue: String = "Root"
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}


//
//enum ViewConfiguration: Equatable, Sendable {
//    case red
//    case green
//    case blue
//
//    struct Key: PreferenceKey {
//        typealias Value = [ViewConfiguration]
//
//        static var defaultValue: Value {
//            []
//        }
//
//        static func reduce(value: inout Value, nextValue: () -> Value) {
//            value.append(contentsOf: nextValue())
//        }
//    }
//}
