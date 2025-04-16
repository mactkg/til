import SwiftUI

/// `@State` を使った簡単なUI実装のサンプル。
///
/// `@State` を使うことで、値の変化をSwiftUIに通知し、UIに変化をもたせられる。
/// isOnが変化すると、SwiftUIは自動的にUIを更新する。
struct StateContentView: View {
    @State private var isOn: Bool = false

    var body: some View {
        VStack {
            Button("ToggleMe!") {
                withAnimation {
                    /// ここで値が変化する
                    isOn.toggle()
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 32)

            /// `isOn` の値によって、ボタンの幅が変化させている
            .frame(maxWidth: isOn ? .infinity : nil)

            /// ここから下はただボタンのスタイルを作ってるだけ
            .foregroundStyle(.myBlack)
            .background(.myBrown)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay() {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.myBlack, lineWidth: 4)
            }
        }
        .padding()
    }
}

#Preview {
    StateContentView()
}
