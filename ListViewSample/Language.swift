//
//  Language.swift
//  ListViewSample
//
//  Created by 申潤五 on 2024/8/27.
//

import SwiftUI

struct Language: View {
    
    var name = "DummyName"
    var test:((_ name:String)->())? = nil
    
    var body: some View {
        VStack{
            Button {
                test?(name)
                print(name)
            } label: {
                Text(name)
                    .font(.system(size: 21))
                    .padding(.all, 10)
                    .frame(maxWidth:.infinity,alignment: .leading)
            }
        }
        .background(.yellow)
        .frame(width:100)
    }
}

#Preview {
    Language()
}
