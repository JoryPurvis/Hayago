//
//  GameState.swift
//  Hayago MessagesExtension
//
//  Created by Jory Purvis on 2/12/23.
//

import Foundation

class GameState: ObservableObject
{
    @Published var board = [[Space]]()
    @Published var turn = Piece.Black
    init()
    {
        resetBoard()
    }
    
    func placePiece(_ row: Int,_ column: Int)
    {
        if(board[row][column].piece != Piece.Empty)
        {
            board[row][column].piece = Piece.Empty
            
        }else{
            board[row][column].piece = turn == Piece.Black ? Piece.Black : Piece.White
        }
        turn = turn == Piece.Black ? Piece.White : Piece.Black
    }
    
    func resetBoard()
    {
        var newBoard = [[Space]]()
        
        for _ in 0...9
        {
            var row = [Space]()
            for _ in 0...9
            {
                row.append(Space(piece: Piece.Empty))
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
