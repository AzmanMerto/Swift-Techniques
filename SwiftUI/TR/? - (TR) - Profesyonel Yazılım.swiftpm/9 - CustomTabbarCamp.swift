//
//  CustomTabbarCamp.swift
//  ? - (TR) - Profesyonel Yazılım
//
//  Created by NomoteteS on 20.04.2023.
//

import SwiftUI

struct CustomTabbarCamp: View {
    
    @State var selection : TabBarItem = .home
    
    var body: some View {
        customTabBarContainerView(selection: $selection) {
            Color.red
                .tabBarItem(item: .home, selection: $selection)
            
            Color.blue
                .tabBarItem(item: .favorite, selection: $selection)
            
            Color.green
                .tabBarItem(item: .profile, selection: $selection)
        }
    }
}

struct CustomTabbarCamp_Previews: PreviewProvider {
    
    static var previews: some View {
//        VStack {
//            Spacer()
//            CustomTabbarView(tabs: tabs, selection: .constant(tabs.first!))
//        }
//        customTabBarContainerView(selection: .constant(tabs.first!)) {
//            Color.red
//        }
        
        CustomTabbarCamp()
    }
}

struct CustomTabbarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace var backgroundItem
    
    var body: some View {
        tabView
    }
}

extension CustomTabbarView {
    private func tabView(item: TabBarItem) -> some View {
        VStack {
            Image(systemName: item.iconName)
                .font(.subheadline)
            Text(item.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
            
        }
        .foregroundColor(selection == item ? item.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background {   item.color.opacity(0.2) }
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation {
            selection = tab
        }
    }
    
    private var tabView: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(item: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background {
            Color.white.opacity(0.4).ignoresSafeArea(edges: .bottom)
        }
    }
}

extension CustomTabbarView {
    
    private func tabView2(item: TabBarItem) -> some View {
        VStack {
            Image(systemName: item.iconName)
                .font(.subheadline)
            Text(item.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
            
        }
        .foregroundColor(selection == item ? item.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background {
            if selection == item {
                RoundedRectangle(cornerRadius: 10)
                    .fill(item.color.opacity(0.2))
                    .matchedGeometryEffect(id: "background_TabBar", in: backgroundItem)
            }
        }
    }
    
    private var tabView2: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(item: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background {
            Color.white.opacity(0.4).ignoresSafeArea(edges: .bottom)
        }
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}


//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case home, favorite, profile
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "heart"
        case .profile:
            return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        case .profile:
            return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return Color.red
        case .favorite:
            return Color.blue
        case .profile:
            return Color.green
        }
    }
}

struct customTabBarContainerView<Content: View> : View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            CustomTabbarView(tabs: tabs, selection: $selection)
        }
        .onPreferenceChange(customTabbarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}


struct customTabbarItemsPreferenceKey: PreferenceKey {
    static let defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}

struct TabBarItemViewModifier: ViewModifier {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1 : 0)
            .preference(key: customTabbarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(item: TabBarItem,selection: Binding<TabBarItem>) -> some View {
        self
            .modifier(TabBarItemViewModifier(tab: item, selection: selection))
    }
}
