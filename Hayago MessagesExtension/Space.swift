//
//  space.swift
//  Hayago MessagesExtension
//
//  Created by Jory Purvis on 2/11/23.
//

import Foundation
import SwiftUI
import UIKit

struct Space
{
    var piece: Piece
    
    func displayPiece() -> String
    {
        switch(piece)
        {
        case Piece.Black: return "B"
        case Piece.White: return "W"
        default: return ""
        }
    }
    func pieceColor() -> Color
    {
        switch(piece)
        {
        case Piece.Black: return Color.black
        case Piece.White: return Color.white
        case Piece.Empty: return Color.clear
        }
    }

}

enum Piece
{
 case Black
 case White
 case Empty
    
}
