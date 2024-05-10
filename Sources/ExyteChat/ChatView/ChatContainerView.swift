//
//  ChatContainerView.swift
//
//
//  Created by Din Vu Dinh on 10/05/2024.
//

import SwiftUI
import FloatingButton
import SwiftUIIntrospect

public struct ChatContainerView<MessageContent: View, InputViewContent: View>: View {
    public typealias MessageBuilderClosure = ((Message, PositionInGroup, @escaping (Attachment) -> Void) -> MessageContent)

    /// To build a custom input view use the following parameters passed by this closure:
    /// - binding to the text in input view
    /// - InputViewAttachments to store the attachments from external pickers
    /// - Current input view state
    /// - .message for main input view mode and .signature for input view in media picker mode
    /// - closure to pass user interaction, .recordAudioTap for example
    /// - dismiss keyboard closure
    public typealias InputViewBuilderClosure = ((
        Binding<String>, InputViewAttachments, InputViewState, InputViewStyle, @escaping (InputViewAction) -> Void, ()->()) -> InputViewContent)
    let messages: [Message]
    private let didSendMessage: (DraftMessage) -> Void
    
    public init(messages: [Message],
                didSendMessage: @escaping (DraftMessage) -> Void,
                messageBuilder: @escaping MessageBuilderClosure,
                inputViewBuilder: @escaping InputViewBuilderClosure) {
        self.messages = messages
        self.didSendMessage = didSendMessage
//        self.sections = ChatView.mapMessages(messages)
//        self.ids = messages.map { $0.id }
//        self.messageBuilder = messageBuilder
//        self.inputViewBuilder = inputViewBuilder
    }

    public var body: some View {
        if #available(iOS 15.0, *) {
            ChatView(messages: self.messages, didSendMessage: didSendMessage)
        } else {
            Text("Khong ho tro")
        }
    }
}
