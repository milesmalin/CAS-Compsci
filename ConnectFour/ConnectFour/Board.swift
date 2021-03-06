//
//  Board.swift
//  ConnectFour
//
//  Created by Miles Malin on 4/27/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import SpriteKit

class Board {
    
    enum Chip {
        case red
        case black
        case empty
    }
    
    class Column {
        var cells: [Cell]
        var dropper: SKShapeNode?
        
        init(ofSize size: Int) {
            cells = (1...size).map({ (_) in Cell(.empty) })
        }
        
    }
    
    class Cell {
        var chip: Chip
        var node: SKShapeNode?
        
        init(_ chip: Chip) {
            self.chip = chip
        }
        
        func fill() {
            if let node = node {
                let color: SKColor
                switch chip {
                case .red:
                    color = SKColor.red
                case .black:
                    color = SKColor.black
                case .empty:
                    color = SKColor.yellow
                }
                node.fillColor = color
            }
        }
    }
    
    let NUM_COLUMNS = 7
    let NUM_ROWS = 6
    
    var columns: [Column]
    var playerTurn: Chip
    
    init() {
        columns = []
        for _ in 1...NUM_COLUMNS {
            let newColumn = Column(ofSize: NUM_ROWS)
            columns.append(newColumn)
        }
        playerTurn = .red
    }
    
    func updateDisplay() {
        for col in columns {
            for cell in col.cells {
                cell.fill()
            }
        }
    }
    
    func resetBoard(){
        for column in columns {
            for cell in column.cells {
                cell.chip = .empty
            }
        }
        self.updateDisplay()
        playerTurn = .red
    }
    
    func dropChip(in column: Column) {
        for cell in column.cells {
            if cell.chip == .empty {
                cell.chip = playerTurn
                passTurn()
                break
            }
        }
    }
    
    func passTurn() {
        if playerTurn == .red {
            playerTurn = .black
        } else if playerTurn == .black {
            playerTurn = .red
        }
    }
    
}
