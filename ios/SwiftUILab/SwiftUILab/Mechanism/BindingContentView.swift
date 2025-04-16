import SwiftUI

/// `@Binding` を使うと値が接続 - バインド - されて、受け取った値を子から変更できるようになる。
/// Sliderも `@Binding` を受け取るようになっていて、Sliderの中から値を変更できる。
struct ColorSliders: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double

    var body: some View {
        Grid(alignment: .leading) {
            GridRow {
                Text("Color Slider")
                    .gridCellColumns(2)
                    .font(.headline)
            }
            GridRow {
                Text("Red")
                Slider(value: $red, in: 0...1)
            }
            GridRow {
                Text("Green")
                Slider(value: $green, in: 0...1)
            }
            GridRow {
                Text("Blue")
                Slider(value: $blue, in: 0...1)
            }
        }
        .padding()
    }
}

/// 一方、このViewのように値を利用するだけで変更しない場合は、 `@Binding` を使う必要がない。
/// 素朴なView Componentとして作ればOK。
struct ColorDebugView: View {
    var red: Double
    var green: Double
    var blue: Double

    var body: some View {
        VStack {
            Text("Red: \(red, specifier: "%.2f")")
            Text("Green: \(green, specifier: "%.2f")")
            Text("Blue: \(blue, specifier: "%.2f")")
        }
    }
}


/// 状態は `@State` で管理できる。 `@State` で管理している値はSwiftUIが監視していて、変更があれば適宜再描画を行なってくれる。
/// 子コンポーネントで値を変更する場合は `@Binding` として値を渡す必要があり、 `$val` と表記して渡す。
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

            /// `@Binding` として渡す例
            ColorSliders(red: $red, green: $green, blue: $blue)

            /// 普通の値として渡す例
            ColorDebugView(red: red, green: green, blue: blue)
        }
        .safeAreaPadding(8)
    }
}

#Preview {
    BindingContentView()
}
