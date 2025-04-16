import SwiftUI

enum AppViews: String, CaseIterable {
    // components
    case stackBasics
    case button

    // mechanisms
    case state
    case binding
    case observableObject
    case observation
    case preferenceKey

    // navigations
    case simple
    case fullScreenCover
    case sheet

    var title: String {
        return self.rawValue.capitalized
    }

    var view: some View {
        switch self {
        case .stackBasics:
            return AnyView(StackBasicsContentView())
        case .button:
            return AnyView(ButtonContentView())
        case .state:
            return AnyView(StateContentView())
        case .binding:
            return AnyView(BindingContentView())
        case .observableObject:
            return AnyView(ObservableObjectContentView())
        case .preferenceKey:
            return AnyView(PreferenceKeyContentView())
        case .observation:
            return AnyView(ObservationContentView())
        case .simple:
            return AnyView(TODOView())
        case .fullScreenCover:
            return AnyView(TODOView())
        case .sheet:
            return AnyView(TODOView())
        }
    }

    static var components: [AppViews] {
        return [.stackBasics, .button]
    }

    static var mechanisms: [AppViews] {
        return [.state, .binding, .observableObject, .observation, .preferenceKey]
    }

    static var navigations: [AppViews] {
        return [.simple, .fullScreenCover, .sheet]
    }

    static var featured: [AppViews] {
        return [.observation, .button, .sheet]
    }
}

struct AppContentView: View {
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    Section("Components") {
                        ForEach(AppViews.components, id: \.self) { view in
                            NavigationLink(view.title, value: view)
                        }
                    }
                    Section("Mechanisms") {
                        ForEach(AppViews.mechanisms, id: \.self) { view in
                            NavigationLink(view.title, value: view)
                        }
                    }
                    Section("Navigations") {
                        ForEach(AppViews.navigations, id: \.self) { view in
                            NavigationLink(view.title, value: view)
                        }
                    }
                }
                .navigationDestination(for: AppViews.self) { view in
                    view.view
                        .navigationTitle(view.title)
                        .navigationBarTitleDisplayMode(.inline)
                }
                .navigationTitle("SwiftUI Lab")
            }
        }
    }
}
