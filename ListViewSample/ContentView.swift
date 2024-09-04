//
//  ContentView.swift
//  ListViewSample
//
//  Created by 申潤五 on 2024/8/27.
//

import SwiftUI

struct Continent: Identifiable {
    let name: String
    let languages: [String]
    var id: String { name }
}


struct ContentView: View {
    let languagesByContinent = [
        "美洲": ["英語", "西班牙語", "葡萄牙語", "法語", "荷蘭語", "德語"],
        "亞洲": ["中文", "日語", "韓語", "印地語", "泰語", "越南語", "馬來語", "印尼語", "菲律賓語", "阿拉伯語"],
        "歐洲": ["英語", "法語", "德語", "意大利語", "西班牙語", "葡萄牙語", "荷蘭語", "俄語", "瑞典語", "挪威語"],
        "非洲": ["英語", "法語", "阿拉伯語", "斯瓦希里語",  "阿姆哈拉語",  "納瓦霍語", "瓦格達語"],
        "大洋洲": ["英語", "毛利語", "塔希提語", "斐濟語",  "關島語", "夏威夷語", "東加語", "庫克群島語", "紐埃語"]
    ]
    @State private var selectedId = "亞洲"
    
    var body: some View {
        let continents = languagesByContinent.map { Continent(name: $0.key, languages: $0.value) }.sorted { item1, item2 in
            item1.name < item2.name
        }
        VStack{
            HStack{
                ForEach(continents) { item in
                    Button {
                        selectedId = item.id
                    } label: {
                        Text(item.name)
                            .padding([.top,.bottom],3)
                            .padding([.leading,.trailing],10)
                    }
                    .frame(width: (UIScreen.main.bounds.width-40)/5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: item.id == selectedId ? 3 : 1)
                    )
                    
                }
            }.animation(Animation.easeInOut ,value:selectedId)
            List{
                ForEach(continents) { continent in
                    if continent.id == (selectedId == "" ? continents[0].name : selectedId){
                        ForEach(continent.languages, id: \.self){ language in
                            Text(language)
                                .font(.system(size: 22))
                        }
                    }
                }
            }.animation(Animation.easeInOut ,value:selectedId)
        }
    }
}

#Preview {
    ContentView()
}
