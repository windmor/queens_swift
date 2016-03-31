//
//  ViewController.swift
//  queens_swift
//
//  Created by Liliya Sayfutdinova on 3/28/16.
//  Copyright © 2016 Liliya Sayfutdinova. All rights reserved.
//

import UIKit

class NIBoard: NSObject {
    var _queensCount = 0;
    
    
    func setBoard(side side: NSInteger) {
        _queensCount = side;
    }
    
    func setQueens() {
        self.config(row: 0, parent: [Int]());
    }
    
    func config(row row: Int, parent parentBoard: [Int]) {
        if (row >= _queensCount) {
            self.checkBoard(board: parentBoard);
            return;
        }
        
        for i in 0 ... _queensCount - 1 {
            let newBoard:[Int] = self.addQueen(withX: row, withY: i, board: parentBoard);
            if (newBoard.isEmpty) { continue; }
            self.config(row: row + 1, parent: newBoard);
        }
        
    }
    
    func addQueen(withX x:Int, withY y:Int, board someBoard:[Int]) -> [Int] {
        var newBoard:[Int] = someBoard;
        
        let maxCount = (someBoard.isEmpty) ? 0 : someBoard.count - 1;
        if (!someBoard.isEmpty) {
            for i in 0 ... maxCount {
                if (x == i || y == newBoard[i] ||
                    labs(x - i) == labs(y - newBoard[i]))
                {
                    return [];
                }
            }
        }
        newBoard.append(y);
        return newBoard;
    }
    
    func checkBoard(board someBoard:[Int]) {
        if (someBoard.count != _queensCount) {
            return;
        }
        
        var resStr:String = "";
        for i in 0 ... _queensCount - 1 {
            resStr += "\(someBoard[i] + 1), ";
        }
        
        print(resStr);
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let board = NIBoard();
        board.setBoard(side: 8);
        board.setQueens();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

