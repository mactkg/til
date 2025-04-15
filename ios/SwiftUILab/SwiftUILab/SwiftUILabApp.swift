import SwiftUI

enum AppViews: String, CaseIterable {
    case preferenceKey
    case button
    case state
    case binding
    case observableObject

    var title: String {
        return self.rawValue.capitalized
    }

    var view: some View {
        switch self {
        case .preferenceKey:
            return AnyView(PreferenceKeyContentView())
        case .button:
            return AnyView(ButtonContentView())
        case .state:
            return AnyView(StateContentView())
        case .binding:
            return AnyView(BindingContentView())
        case .observableObject:
            return AnyView(ObservableObjectContentView())
        }
    }

    static var components: [AppViews] {
        return [.button]
    }

    static var mechanism: [AppViews] {
        return [.state, .binding, .observableObject, .preferenceKey]
    }
}

@main
struct SwiftUILabApp: App {

    var body: some Scene {
        WindowGroup {
            VStack {
                NavigationStack {
                    List {
                        Section("Components") {
                            ForEach(AppViews.components, id: \.self) { view in
                                NavigationLink(view.title, value: view)
                            }
                        }
                        Section("Mechanisms") {
                            ForEach(AppViews.mechanism, id: \.self) { view in
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
}
