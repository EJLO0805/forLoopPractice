//
//  ViewController.swift
//  forLoopPractice
//
//  Created by 羅以捷 on 2022/6/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var content = ""
        for _ in 1...2{
            for _ in 1...2{
                content = content + "🥰"
            }
            content = content + "\n"
        }
        showResult.text = content
        rowsNum.text = "2"
    }
    @IBOutlet weak var showResult: UILabel!
    @IBOutlet weak var rowsNum: UILabel!
    @IBOutlet weak var selectShape: UISegmentedControl!
    @IBOutlet weak var selectRows: UISlider!
    @IBAction func changeRowsAct(_ sender: Any) {
        selectRows.value = selectRows.value.rounded()
        let rows = Int(selectRows.value)
        let shape = selectShape.selectedSegmentIndex
        var content = ""
        switch shape {
        case 0 :
            for _ in 1...rows{
                for _ in 1...rows{
                    content = content + "🥰"
                }
                content = content + "\n"
            }

        case 1 :
            for i in 1...rows{
                for _ in 1...i{
                    content = content + "🥰"
                }
                content = content + "\n"
            }
        case 2 :
            for i in 1...rows*2-1{
                if i <= rows {
                    for _ in 1...i{
                        content = content + "🥰"
                    }
                    content = content + "\n"
                } else {
                    for _ in i...rows*2-1{
                        content = content + "🥰"
                    }
                    content = content + "\n"
                }
            }
        case 3 :
            for i in 1...rows*2-1 {
                for j in 1...rows*2-1{
                    if i == rows || j == rows {
                        content = content + "🥰"
                    } else {
                        content = content + "🫥"
                    }
                }
                content = content + "\n"
            }
        case 4 :
            for i in 1...rows{
                for j in 1...rows{
                    if i%2 == 0, j%2 == 0 {
                        content = content + "🥰"
                    } else if i%2 != 0, j%2 != 0 {
                        content = content + "🥰"
                    } else {
                        content = content + "🫥"
                    }
                }
                content = content + "\n"
            }
        case 5 :
            var number = 1
            for i in 1...rows*2-1{
                for _ in 1...number{
                    content = content + "🥰"
                }
                if i < rows {
                    number = number + 2
                } else {
                    number = number - 2
                }
                content = content + "\n"
            }
        default :
            let icon = ["🥰", "🫥", "😈", "💀", "💩", "🧛🏼‍♀️", "🧝‍♀️"]
            var number = 1
            var role = 0
            for i in 1...rows*2-1{
                for _ in 1...number{
                    content = content + icon[role]
                }
                if i < rows {
                    number = number + 2
                    role = role + 1
                } else {
                    number = number - 2
                    role = role - 1
                }
                content = content + "\n"
            }
        }
        showResult.text = content
        rowsNum.text = String(rows)
    }
}

