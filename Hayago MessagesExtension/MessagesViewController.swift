//
//  MessagesViewController.swift
//  Hayago MessagesExtension
//
//  Created by Jory Purvis on 2/10/23.
//

import UIKit
import SwiftUI
import Messages

class MessagesViewController: MSMessagesAppViewController {
    var hostingController: UIHostingController<MySwiftUIView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a SwiftUI view to display in the iMessage app
        let swiftUIView = MySwiftUIView()
        
        // Embed the SwiftUI view inside a UIHostingController
        hostingController = UIHostingController(rootView: swiftUIView)
        
        // Add the hosting controller's view to the view hierarchy
        if let hostingController = hostingController {
            addChild(hostingController)
            view.addSubview(hostingController.view)
            hostingController.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
                hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
            hostingController.didMove(toParent: self)
        }
    }
    //.opacity(selectedCell != nil && selectedCell! == (row, column) ? 1.0 : 0.0)

    struct MySwiftUIView: View {
        @StateObject var gameState = GameState()
        let numCells = 9
        
        @State private var selectedCell: (row: Int, column: Int)? = nil
        
        var body: some View {
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            let squareSize = min(screenWidth, screenHeight) / CGFloat(numCells)
            
            ZStack(alignment: .center) {
                Image("GoBoard")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: squareSize * CGFloat(numCells), height: squareSize * CGFloat(numCells))
                    .alignmentGuide(HorizontalAlignment.trailing) { d in d[HorizontalAlignment.trailing] }
                    .alignmentGuide(VerticalAlignment.bottom) { d in d[VerticalAlignment.bottom] }
                
                VStack(spacing: 0) {
                    ForEach(0..<numCells) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<numCells) { column in
                                let space = gameState.board[row][column]
                                Text(space.displayPiece())
                                    .frame(width: squareSize, height: squareSize)
                                    //.foregroundColor(space.pieceColor())
                                    .background(Color.clear)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        gameState.placePiece(row,column)
                                    }
                                /*Rectangle()
                                    .background(
                                        Text(space.displayPiece())
                                        //Circle()
                                          //  .fill(Color.black)
                                            //.opacity(selectedCell != nil && selectedCell! == (row, column) ? 1.0 : 0.0)
                                    )
                                    .frame(width: squareSize, height: squareSize)
                                    .foregroundColor(space.pieceColor())
                                    .background(Color.clear)
                                    .onTapGesture {
                                        gameState.placePiece(row,column)
                                        print(space.displayPiece())
                                    }
                                 */
                            }
                        }
                    }
                }
                .alignmentGuide(HorizontalAlignment.trailing) { d in d[HorizontalAlignment.trailing] }
                .alignmentGuide(VerticalAlignment.bottom) { d in d[VerticalAlignment.bottom] }
            }.contentShape(Rectangle())
        }
    }





    
    // Conversation handling methods...
}

    //this code was here in the template, I don't know what it does yet
extension MessagesViewController {
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dismisses the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}
