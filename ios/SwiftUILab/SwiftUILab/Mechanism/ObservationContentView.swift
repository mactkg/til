import SwiftUI
import Observation

/// Observation frameworkを使ったSwiftUIの状態管理のサンプル
///
/// https://www.youtube.com/watch?v=W6FF70H_GwI
///
/// `@Observable` を使うと、`@StateObject` などを使わずに状態を持ったClassを管理できる。
/// `@ObservableObject` を使う時よりもパフォーマンスが良いこともあり、Deployment TargetがiOS17以上の時はこちらを使った方が良さそうに思われる。

/// `@Observable` をclassにつけると、そのプロパティを監視してSwiftUIの描画に活用することができる。
/// 実際に利用方法は `ObservationContentView` を参考にすること。
@Observable class ObservationColorViewModel {
    var red: Double = 0.5
    var green: Double = 0.5
    var blue: Double = 0.5

    func toColor() -> Color {
        Color(red: red, green: green, blue: blue)
    }
}

/// このビューの中で変更を検知して描画を行いたい場合は、 `@Bindable` は不要。
/// `ColorSliders` 内でViewModelの値を変更したいので `@Binding` として渡したく、その場合は `@Bindable` をつける必要があるだけ。
struct ObservationContentView: View {
    @Bindable private var vm = ObservationColorViewModel()

    var body: some View {
        VStack(spacing: 32) {
            Rectangle()
                .fill(vm.toColor())
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            /// `$bindableObject` と表記すれば、 `Binding` として渡すことができる。
            ColorSliders(red: $vm.red, green: $vm.green, blue: $vm.blue)

            /// ColorDebugViewは値を変更しないので、 `@Binding` は必要なく、そのまま値を渡して良い。
            ColorDebugView(red: vm.red, green: vm.green, blue: vm.blue)
        }
        .safeAreaPadding(8)
    }
}

#Preview {
    ObservationContentView()
}
