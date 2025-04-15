//
//  SwiftUIView.swift
//  SwiftUILab
//
//  Created by 原　健太 on 2025/04/14.
//

import SwiftUI

struct Trackable<Content>: View where Content: View {
    var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack {
            content()
        }
        .onPreferenceChange(ContainerTitleKey.self) { value in
            track(param: value)
        }
    }
}


struct Page: View {
    var title: String

    var body: some View {
        VStack {
            Text(title)
        }
        .preference(key: ContainerTitleKey.self, value: title)
    }
}

enum PreferenceKeyPages: CaseIterable, Hashable {
    case pageA
    case pageB
    case pageC
    case pageD

    var title: String {
        switch self {
        case .pageA: return "Page A"
        case .pageB: return "Page B"
        case .pageC: return "Page C"
        case .pageD: return "Page D"
        }
    }
}

func track(param: String) {
    print("Tracking: \(param)")
}

struct PreferenceKeyContentView: View {
    let pages = PreferenceKeyPages.allCases

    var body: some View {
        Trackable {
            VStack {
                List(pages, id: \.self) { page in
                    NavigationLink(page.title, value: page)
                }
                .navigationDestination(for: PreferenceKeyPages.self) { page in
                    Page(title: page.title)
                }
            }
        }
    }
}

#Preview {
    PreferenceKeyContentView()
}
