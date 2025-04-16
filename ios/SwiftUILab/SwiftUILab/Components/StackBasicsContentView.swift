import SwiftUI

struct StackBasicsContentView: View {
    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            VStack {
                Text("VStackで")
                Text("囲むと")
                Text("縦に積める")
            }
            VStack(spacing: 8) {
                Text("VStackでspacingを指定すれば")
                Text("その間隔で")
                Text("アイテム同士が離される")
            }
            HStack() {
                Text("HStack")
                Text("は")
                Text("横に積むよ")
            }
            HStack() {
                Text("Spacer")
                Spacer()
                Text("は")
                Spacer()
                Text("空間を")
                Spacer()
                ForEach(Array("ひろげるよ！".split(separator: "").enumerated()), id: \.element) { index, char in
                    Text(char)
                    index < 4 ? Spacer() : nil
                }
            }
            ZStack {
                Text("ZStackは")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("そのままかさなる")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text("offsetでずらして配置")
                    .offset(x: -50, y: 20)
            }
            .padding()
            .background(.myGrey, in: RoundedRectangle(cornerRadius: 10, style: .continuous))

            Spacer()

            ZStack {
                VStack(alignment: .leading) {
                    Text("SwiftUILab")
                    Spacer()
                    HStack {
                        Text("Established")
                        Spacer()
                        Text("2025")
                    }
                    .font(.caption)
                }
                .padding()
            }
            .frame(maxWidth: 200, maxHeight: 80)
            .background(.myBrown, in: RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.myBlack, lineWidth: 4)
            }
        }
    }
}

#Preview {
    StackBasicsContentView()
}
