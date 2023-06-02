//
//  ProductDetail.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import SwiftUI


// https://tutorial101.blogspot.com/2021/09/swiftui-detect-device-rotation-portrait.html
// orientation
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}


struct  ProductDetail: View {
    @State private var orientation = UIDevice.current.orientation
    var product: Product
    var body: some View {
        VStack{
            Text(product.name ?? "")
                .fontWeight(Font.Weight.heavy)
                .foregroundColor(ThemeColor.primary)
                .font(.system(size: 32))
                .textCase(.uppercase)
            Spacer()
            KingFisherImageView(url: product.imageURL ?? "")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .padding([.leading, .trailing], 24)
        }.padding([.top, .bottom, .leading, .trailing], 24)
//        Group {
//            if orientation.isLandscape {
//                HStack(alignment: .center){
//                    KingFisherImageView(url: product.imageURL)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
//                        .clipShape(Circle())
//                        .overlay {
//                            Circle().stroke(.white, lineWidth: 4)
//                        }
//                        .shadow(radius: 7)
//                        .padding([.leading, .trailing], 24)
//
//                    Spacer()
//                    Spacer()
//                    Text(product.name)
//                        .fontWeight(Font.Weight.heavy)
//                        .foregroundColor(ThemeColor.primary)
//                        .font(.system(size: 32))
//                        .textCase(.uppercase)
//
//
//                }.padding([.top, .bottom, .leading, .trailing], 24)
//            } else {
//                VStack{
//                    Text(product.name)
//                        .fontWeight(Font.Weight.heavy)
//                        .foregroundColor(ThemeColor.primary)
//                        .font(.system(size: 32))
//                        .textCase(.uppercase)
//                    Spacer()
//                    KingFisherImageView(url: product.imageURL)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
//                        .clipShape(Circle())
//                        .overlay {
//                            Circle().stroke(.white, lineWidth: 4)
//                        }
//                        .shadow(radius: 7)
//                        .padding([.leading, .trailing], 24)
//                }.padding([.top, .bottom, .leading, .trailing], 24)
//            }
//        }
//        .onRotate { newOrientation in
//            orientation = newOrientation
//        }
    }
}


struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: 1, name: "Stylish Cat", description: "", price: 88.9, imageURL: "https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80", imageData: nil)
        ProductDetail(product: product)
    }
}
