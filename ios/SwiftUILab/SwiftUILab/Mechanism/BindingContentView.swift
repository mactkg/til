import SwiftUI

/// `@Binding` を使うことで、親から子に状態を渡せる。
/// Sliderも `@Binding` を受け取るようになっていて、Sliderの中から値を変更できる。
/// Bindingを使えば双方向に値をやり取りできるということ。
struct ColorSliders: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double

    var body: some View {
        VStack {
            HStack {
                Text("Red")
                Slider(value: $red, in: 0...1)
            }
            HStack {
                Text("Green")
                Slider(value: $green, in: 0...1)
            }
            HStack {
                Text("Blue")
                Slider(value: $blue, in: 0...1)
            }
        }
        .padding()
    }
}

struct ColorDebugView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double

    var body: some View {
        VStack {
            Text("Red: \(red, specifier: "%.2f")")
            Text("Green: \(green, specifier: "%.2f")")
            Text("Blue: \(blue, specifier: "%.2f")")
        }
    }
}

/// 状態は `@State` で管理できる。 `@Binding` を使うことで、親から子に状態を渡せる。
/// `$val` の形式にすることで、Bindingとして渡せる。
struct BindingContentView: View {
    @State private var red: Double = 0.5
    @State private var green: Double = 0.5
    @State private var blue: Double = 0.5

    var body: some View {
        VStack(spacing: 32) {
            Rectangle()
                .fill(Color(red: red, green: green, blue: blue))
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            ColorSliders(red: $red, green: $green, blue: $blue)

            ColorDebugView(red: $red, green: $green, blue: $blue)
        }
        .safeAreaPadding(8)
    }
}

#Preview {
    BindingContentView()
}
