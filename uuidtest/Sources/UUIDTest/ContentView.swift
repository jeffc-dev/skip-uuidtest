import SwiftUI

public struct ContentView: View {
    @AppStorage("tab") var tab = Tab.welcome
    @AppStorage("name") var name = "Skipper"
    @State var appearance = ""
    @State var isBeating = false

	// Test random UUIDS...
	let uuids = [UUID(), UUID(), UUID(), UUID(), UUID()]
	@State private var firstUUID:UUID?

	// Test random Ints...
	let ints = [Int.random(in: 1...1000), Int.random(in: 1...1000), Int.random(in: 1...1000), Int.random(in: 1...1000), Int.random(in: 1...1000)]
	@State private var firstInt:Int?

	init() {
	}

    public var body: some View {
        TabView(selection: $tab) {
			VStack(alignment: .center, spacing: 4.0) {
				Text("self.uuids")
					.font(.caption)
					.bold()
					.padding(.top)

				VStack(alignment: .center, spacing: 4.0) {
					ForEach(uuids, id: \.self) { uuid in
						Text(String(describing: uuid))
							.font(.caption)
					}
				}
				.padding(.top)

				Text("first UUID in self.uuids")
					.font(.caption)
					.bold()
					.padding(.top)

				Text(String(describing: self.uuids.first))
					.font(.caption)
					.padding(.top)

				Text("self.firstUUID")
					.font(.caption)
					.bold()
					.padding(.top)

				Text(String(describing: self.firstUUID))
					.font(.caption)
					.padding(.top)

				Text("self.firstUUID matches first UUID in array?")
					.font(.caption)
					.bold()
					.padding(.top)

				Text(self.firstUUID == self.uuids.first ? "Yes!" : "No!")
					.font(.caption)
					.padding(.top)
            }
			.task {
				self.firstUUID	= self.uuids.first
			}
            .font(.largeTitle)
            .tabItem { Label("UUIDs", systemImage: "heart.fill") }
            .tag(Tab.welcome)

			VStack(alignment: .center, spacing: 4.0) {
				Text("self.ints")
					.font(.caption)
					.bold()
					.padding(.top)

				VStack(alignment: .center, spacing: 4.0) {
					ForEach(ints, id: \.self) { int in
						Text(String(describing: int))
							.font(.caption)
					}
				}
				.padding(.top)

				Text("first int in self.ints")
					.font(.caption)
					.bold()
					.padding(.top)

				Text(String(describing: self.ints.first))
					.font(.caption)
					.padding(.top)

				Text("self.firstInt")
					.font(.caption)
					.bold()
					.padding(.top)

				Text(String(describing: self.firstInt))
					.font(.caption)
					.padding(.top)

				Text("self.firstInt matches first Int in array?")
					.font(.caption)
					.bold()
					.padding(.top)

				Text(self.firstInt == self.ints.first ? "Yes!" : "No!")
					.font(.caption)
					.padding(.top)
			}
			.task {
				self.firstInt	= self.ints.first
			}
			.tabItem { Label("Ints", systemImage: "house.fill") }
			.tag(Tab.home)
}
        .preferredColorScheme(appearance == "dark" ? .dark : appearance == "light" ? .light : nil)
    }
}

enum Tab : String, Hashable {
    case welcome, home
}
