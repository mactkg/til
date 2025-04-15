import SwiftUI

/// ObservableObjectなクラスを作ると、 `@StateObject` や `@ObservedObject` を使って状態管理できる。
/// 購読できるプロパティは `@Published` をつける。
/// `Observation` もあるので、そちらも後で試す。
/// https://www.youtube.com/watch?v=W6FF70H_GwI
class ObservableColorViewModel: ObservableObject {
    @Published var red: Double = 0.5
    @Published var green: Double = 0.5
    @Published var blue: Double = 0.5

    func toColor() -> Color {
        Color(red: red, green: green, blue: blue)
    }
}

struct ObservableObjectContentView: View {
    @StateObject private var vm = ObservableColorViewModel()

    var body: some View {
        VStack(spacing: 32) {
            Rectangle()
                .fill(vm.toColor())
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            ColorSliders(red: $vm.red, green: $vm.green, blue: $vm.blue)

            ColorDebugView(red: $vm.red, green: $vm.green, blue: $vm.blue)
        }
        .safeAreaPadding(8)
    }
}

#Preview {
    BindingContentView()
}
