//
//  ContentView.swift
//  list3ViewApp
//
//  Created by Takahashi Tomoko on 2020/09/09.
//  Copyright © 2020 takatomo.com. All rights reserved.
//

import SwiftUI
import Combine //大文字開始 他のものと接続するために使う

struct ContentView: View {
    //データを取ってくる TaskFilesから
    @ObservedObject var nList = namesList()
    
    @ObservedObject var tList = TaskList()
    
    //テキストフィールドとボタンを作る
    //newTaskという変数を持った構造体 入力される文字のこと
    @State var newTask : String = ""
    
    
    //変数addTaskBar TextFieldを表示するためにbodyに入れる必要があるが、まず変数に入れている
    var addTaskBar : some View {
        HStack { //テキストフィールドの横にボタンを追加したいから
            TextField("追加してください",text: self.$newTask)
            //addボタンの追加 ボタンのアクションとしてaddNewTaskが発火する labelはボタンの見た目
            Button(action: self.addNewTask, label: {Text("add")})
        }
    }
    
    
    //addNewTaskが発火するのは、 addTaskBarの中に書いているボタンを押した時
    //ボタンを押したら、tList = TaskList()が持っている構造体のidとitemに登録したい
    func addNewTask() {
        //tListでアクセスして、配列tasksに値を追加 Task構造体を使って配列tasksに追加
        //idとして入力された数分＋1してセルの数を作成 taskItemには入力された文字を入れる
        tList.tasks.append(Task(id: String(tList.tasks.count + 1), taskItem: newTask))
        //値を追加したと同時にnewTask(入力された文字)を一度空にする
        self.newTask = ""
    }
    
    
    
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                addTaskBar.padding() //テキストフィールド
                List { //溜まっていくリスト
                    // ForEach繰り返し処理  配列namesの要素分だけ
                    ForEach(self.tList.tasks){
                        //テキストを表示しなさい (配列namesの中身)
                        Index in Text(Index.taskItem) //taskItemはユーザーが入力した値
                        //保存はできたので、今からユーザーが入力するフィールドとボタンを作る
                    }.onDelete(perform: rowRemove)

                }.navigationBarTitle("Taskリスト")
                .navigationBarItems(trailing: EditButton())
            }
        }
        
        
    };func rowRemove(offsets: IndexSet) {
        tList.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
