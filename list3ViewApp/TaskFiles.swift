//
//  File.swift
//  list3ViewApp
//
//  Created by Takahashi Tomoko on 2020/09/09.
//  Copyright © 2020 takatomo.com. All rights reserved.
//

import Foundation
import SwiftUI //
import Combine //他のものと接続


//ユーザーが入力した値を保存するものをつくる
struct Task: Identifiable {
    var id = String()  //Userdefaultsの保存と同じで、idとtaskItemで管理
    var taskItem = String()  //taskItemの中にユーザーが入力した値
}

//クラス //Task構造体を配列tasksに入れている
class TaskList: ObservableObject {
    @Published var tasks = [Task]() //tasksは配列
}



class namesList: ObservableObject {  //ObservableObject はデータの受け渡しで書く必要
    @Published var names:[String] = ["米倉","青木","井上","牛川","江田"]
    //@Published は値を他のクラス間での受け渡しで書く必要
}

//TaskFilesで作った配列をcontenViewのListの中に読み込ませたい

struct TaskFiles_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
