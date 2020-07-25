//
//  ContentView.swift
//  Weight on Planets
//
//  Created by Kadir on 25.07.2020.
//  Copyright © 2020 Kadir. All rights reserved.
//

/*
 Formula

 Mercury: 0.38
 Venus: 0.91
 Earth: 1.00
 Mars: 0.38
 Jupiter: 2.34
 Saturn: 1.06
 Uranus: 0.92
 Neptune: 1.19

 weight = mass x surface gravity,
 */

import SwiftUI

struct ContentView: View {
    var planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
    @State private var selectedPlanet = 2
    @State private var weight = 70

    func calculateWeight() -> Double {
        switch selectedPlanet {
        case 0:
            return (Double(weight) * 0.38)
        case 1:
            return (Double(weight) * 0.91)
        case 2:
            return (Double(weight) * 1.00)
        case 3:
            return (Double(weight) * 0.38)
        case 4:
            return (Double(weight) * 2.34)
        case 5:
            return (Double(weight) * 1.06)
        case 6:
            return (Double(weight) * 0.92)
        case 7:
            return (Double(weight) * 1.19)
        default:
            print("")
        }
        return 0
    }

    var body: some View {

        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("\(planets[self.selectedPlanet])")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.9, maxHeight: UIScreen.main.bounds.height * 0.4)
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 30)

                HStack {
                    Spacer()
                    Picker(selection: self.$selectedPlanet, label: Text("")) {
                        ForEach(0 ..< self.planets.count) {
                            Text(self.planets[$0]).foregroundColor(.white)
                        }
                    }
                    .clipped()
                    .frame(width: UIScreen.main.bounds.width / 3, height: 100, alignment: .center)
                    Spacer()
                    Picker(selection: $weight, label: Text("")) {
                        ForEach(0 ..< 500) { i in
                            Text("\(i)").foregroundColor(.white)
                        }
                    }
                    .clipped()
                    .frame(width: UIScreen.main.bounds.width / 3, height: 100, alignment: .center)
                    Spacer()
                }
                .padding(.top, 60)
                Spacer()
                Text("Weight is \(calculateWeight(), specifier: "%.1f") kg on \(planets[self.selectedPlanet])")
                    .foregroundColor(.white)
                    .font(Font.system(size: 24))
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewDevice("iPhone 8")
        }
    }
}
