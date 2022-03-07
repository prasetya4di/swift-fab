import SwiftUI

struct ContentView: View {
  @State private var clickCount = 0
  
  var body: some View {
    VStack {
      Text("Button Pressed \(clickCount)")
        .padding()
    }
    .floatingActionButton(
      backgroundColor: .orange,
      content: Text("Tambahkan").padding(16),
      position: .trailing
    ) {
      clickCount += 1
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
