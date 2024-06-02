import SwiftUI

public struct RoutingView<Content: View, Destination: Routable>: View {
    @StateObject var router: Router<Destination> = .init(isPresented: .constant(.none))
    private let rootContent: (Router<Destination>) -> Content
    
    public init(_ routeType: Destination.Type, @ViewBuilder content: @escaping (Router<Destination>) -> Content) {
        self.rootContent = content
    }
    
    public var body: some View {
        NavigationStack(path: $router.path) {
            rootContent(router)
                .navigationDestination(for: Destination.self) { route in
                    router.view(for: route)
                }
        }
        .sheet(item: $router.presentingSheet) { route in
                router.view(for: route)
        }
        .fullScreenCover(item: $router.presentingFullScreenCover) { route in
                router.view(for: route)
        }
    }
}

enum ViewsRoute: Routable {
    case login
    case verification
    case home
    
    @ViewBuilder
    func viewToDisplay(router: Router<Self>) -> some View {
        switch self {
        case .login:
            LoginView(router: router)
        case .verification:
            EmptyView()
        case .home:
            HomeView(router: router)
        }
    }
    
    var navigationType: NavigationType {
        switch self {
        case .login:
            return .push
        case .verification:
            return .push
        case .home:
            return .push
        }
    }
    
}
