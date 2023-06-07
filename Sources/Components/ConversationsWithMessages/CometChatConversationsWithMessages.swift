//
//  CometChatConversationsWithMessages.swift
 
//
//  Created by Pushpsen Airekar on 11/12/21.
//
import UIKit
import CometChatPro

public class CometChatConversationsWithMessages: CometChatConversations {
    
    var messagesConfiguration: MessagesConfiguration?
    var conversationsConfiguration: ConversationsConfiguration?
    var user: User? = nil
    var group: Group? = nil
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let user = user {
            navigateToMessagesForUser(user: user)
        } else if let group = group {
            navigateToMessagesForGroup(group: group)
        }
        connectListener()
        callbacks()
    }
    
    private func connectListener() {
        CometChatConversationEvents.addListener("conversation-with-messages", self as CometChatConversationEventListener)
        CometChatGroupEvents.addListener("conversation-with-messages-groups", self)
        
        // NEW
        CometChat.addGroupListener("conversations-with-messages-groups-sdk-listerner", self)
        CometChatGroupEvents.addListener("conversations-with-message-groups-events-listerner", self)
    }
    
    private func callbacks() {
        
        // when user do onItemClick
        onDidSelect = { [weak self] (conversation, indexPath) in
            guard let this = self else { return }
            if let user = conversation.conversationWith as? User  {
                this.navigateToMessagesForUser(user: user)
            } else if let group = conversation.conversationWith as? Group {
                this.navigateToMessagesForGroup(group: group)
            }
        }
    }
   
    // when user click on back button.
    override func onBackCallback() {
        if let onBack = onBack {
            onBack()
        } else {
            self.dismiss(animated: true)
        }
    }
    
    @discardableResult
    public func set(messagesConfiguration: MessagesConfiguration) -> Self {
        self.messagesConfiguration = messagesConfiguration
        return self
    }
    
    @discardableResult
    public func set(conversationsConfiguration: ConversationsConfiguration) -> Self {
        self.conversationsConfiguration = conversationsConfiguration
        setConverstionsConfiguration()
        return self
    }
    
    @discardableResult
    public func set(user: User?) -> Self {
        self.user = user
        return self
    }
    
    @discardableResult
    public func set(group: Group?) -> Self {
        self.group = group
        return self
    }
    
    private func setConverstionsConfiguration() {
        if let conversationsConfiguration = conversationsConfiguration {
            
            if let title = conversationsConfiguration.title {
                set(title: title, mode: conversationsConfiguration.titleMode)
            }
            
            if let emptyStateText = conversationsConfiguration.emptyStateText {
                set(emptyStateText: emptyStateText)
            }
            
            if let errorStateText = conversationsConfiguration.errorStateText {
                set(errorStateText: errorStateText)
            }
            
            if let hideSearch = conversationsConfiguration.hideSearch {
                hide(search: hideSearch)
            }
            
            if let hideSeparator = conversationsConfiguration.hideSeparator {
                hide(separator: hideSeparator)
            }
            
            if let disableTyping = conversationsConfiguration.disableTyping {
                disable(typing: disableTyping)
            }
            
            if let disableReceipt = conversationsConfiguration.disableReceipt {
                disable(receipt: disableReceipt)
            }
            
            if let disableUsersPresence = conversationsConfiguration.disableUsersPresence {
                disable(userPresence: disableUsersPresence)
            }
            
            if let disableSoundForMessages = conversationsConfiguration.disableSoundForMessages {
                disable(soundForMessages: disableSoundForMessages)
            }
            
            if let showBackButton = conversationsConfiguration.showBackButton {
                show(backButton: showBackButton)
            }
            
            if let searchBoxIcon = conversationsConfiguration.searchBoxIcon {
                set(searchIcon: searchBoxIcon)
            }
            
            if let sentIcon = conversationsConfiguration.sentIcon {
                set(sentIcon: sentIcon)
            }
            
            if let deliveredIcon = conversationsConfiguration.deliveredIcon {
                set(deliveredIcon: deliveredIcon)
            }
            
            if let readIcon = conversationsConfiguration.readIcon {
                set(readIcon: readIcon)
            }
            
            if let badgeStyle = conversationsConfiguration.badgeStyle {
                set(badgeStyle: badgeStyle)
            }
            
            if let dateStyle = conversationsConfiguration.dateStyle {
                set(dateStyle: dateStyle)
            }
            
            if let receiptStyle = conversationsConfiguration.receiptStyle {
                set(receiptStyle: receiptStyle)
            }
            
            if let conversationsStyle = conversationsConfiguration.conversationsStyle {
                set(conversationsStyle: conversationsStyle)
            }
            
            if let avatarStyle = conversationsConfiguration.avatarStyle {
                set(avatarStyle: avatarStyle)
            }
            
            if let statusIndicatorStyle = conversationsConfiguration.statusIndicatorStyle {
                set(statusIndicatorStyle: statusIndicatorStyle)
            }
            
            if let listItemStyle = conversationsConfiguration.listItemStyle {
                set(listItemStyle: listItemStyle)
            }
            
            if let protectedGroupIcon = conversationsConfiguration.protectedGroupIcon {
                set(protectedGroupIcon: protectedGroupIcon)
            }
            
            if let privateGroupIcon = conversationsConfiguration.privateGroupIcon {
                set(privateGroupIcon: privateGroupIcon)
            }
            
            if let datePattern = conversationsConfiguration.datePattern {
                setDatePattern(datePattern: datePattern)
            }
            
            if let listItemView = conversationsConfiguration.listItemView {
                setListItemView(listItemView: listItemView)
            }
            
            if let menus = conversationsConfiguration.menus {
               set(menus: menus)
            }
            
            if let subtitleView = conversationsConfiguration.subtitleView {
                setSubtitle(subtitleView: subtitleView)
            }
            
            if let searchPlaceholder = conversationsConfiguration.searchPlaceholder {
                set(searchPlaceholder: searchPlaceholder)
            }
            
            if let emptyView = conversationsConfiguration.emptyView {
                set(emptyView: emptyView)
            }
            
            if let errorView = conversationsConfiguration.errorView {
                set(errorView: errorView)
            }
            
            if let backButton = conversationsConfiguration.backButton {
                set(backButtonIcon: backButton)
            }
            
            if let selectedConversations = conversationsConfiguration.selectedConversations {
                getSelectedConversations()
            }
            
            if let mode = conversationsConfiguration.selectionMode {
                selectionMode(mode: mode)
            }
            
            if let onItemClick = conversationsConfiguration.onItemClick {
               setOnItemClick(onItemClick: onItemClick)
            }
        }
    }
    
    private func navigateToMessagesForUser(user: User) {
        let cometChatMessages: CometChatMessages = CometChatMessages()
        cometChatMessages.set(user: user)
        
        if let messagesConfiguration =  messagesConfiguration {
            cometChatMessages.set(detailsConfiguration: messagesConfiguration.detailsConfiguration)
            if let messageListConfiguration = messagesConfiguration.messageListConfiguration {
                cometChatMessages.set(messageListConfiguration: messageListConfiguration)
            }
            
            if let messageComposerConfiguration = messagesConfiguration.messageComposerConfiguration {
                cometChatMessages.set(messageComposerConfiguration: messageComposerConfiguration)
            }
            
            if let messageHeaderConfiguration = messagesConfiguration.messageHeaderConfiguration {
                cometChatMessages.set(messageHeaderConfiguration: messageHeaderConfiguration)
            }
            
            if let auxiliaryMenu = messagesConfiguration.auxiliaryMenu {
                cometChatMessages.setAuxiliaryMenu(auxiliaryMenu: auxiliaryMenu)
            }
            
            if let threadedMessageConfiguration = messagesConfiguration.threadedMessageConfiguration {
                cometChatMessages.set(threadedMessageConfiguration: threadedMessageConfiguration)
            }
            cometChatMessages.setMessageListView(messageListView: messagesConfiguration.messageListView)
            cometChatMessages.setMessageHeaderView(messageHeaderView: messagesConfiguration.messageHeaderView)
            cometChatMessages.setMessageComposerView(messageComposerView: messagesConfiguration.messageComposerView)
            
            if let hideMessageHeader = messagesConfiguration.hideMessageHeader {
                cometChatMessages.hide(messageHeader: hideMessageHeader)
            }
            
            if let hideMessageComposer = messagesConfiguration.hideMessageComposer {
                cometChatMessages.hide(messageComposer: hideMessageComposer)
            }
            
            if let messageStyle = messagesConfiguration.messagesStyle {
                cometChatMessages.set(messagesStyle: messageStyle)
            }
            
            if let customSoundForIncomingMessages = messagesConfiguration.customSoundForIncomingMessages {
                cometChatMessages.set(customSoundForIncomingMessages: customSoundForIncomingMessages)
            }
            
            if let customSoundForOutgoingMessages =  messagesConfiguration.customSoundForOutgoingMessages {
                cometChatMessages.set(customSoundForOutgoingMessages: customSoundForOutgoingMessages)
            }
        }
        
        cometChatMessages.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(cometChatMessages, animated: true)
    }
    
    private func navigateToMessagesForGroup(group: Group) {
        let cometChatMessages: CometChatMessages = CometChatMessages()
        cometChatMessages.set(group: group)
        
        if let messagesConfiguration =  messagesConfiguration {
            cometChatMessages.set(detailsConfiguration: messagesConfiguration.detailsConfiguration)
            cometChatMessages.set(messageListConfiguration: messagesConfiguration.messageListConfiguration)
            cometChatMessages.set(messageComposerConfiguration: messagesConfiguration.messageComposerConfiguration)
            cometChatMessages.set(messageHeaderConfiguration: messagesConfiguration.messageHeaderConfiguration)
            cometChatMessages.setMessageListView(messageListView: messagesConfiguration.messageListView)
            cometChatMessages.setMessageHeaderView(messageHeaderView: messagesConfiguration.messageHeaderView)
            cometChatMessages.setMessageComposerView(messageComposerView: messagesConfiguration.messageComposerView)
            
            if let hideMessageHeader = messagesConfiguration.hideMessageHeader {
                cometChatMessages.hide(messageHeader: hideMessageHeader)
            }
            if let auxiliaryMenu = messagesConfiguration.auxiliaryMenu {
                cometChatMessages.setAuxiliaryMenu(auxiliaryMenu: auxiliaryMenu)
            }
           
            if let hideMessageComposer = messagesConfiguration.hideMessageComposer {
                cometChatMessages.hide(messageComposer: hideMessageComposer)
            }
            
            if let messageStyle = messagesConfiguration.messagesStyle {
                cometChatMessages.set(messagesStyle: messageStyle)
            }
            
            if let customSoundForIncomingMessages = messagesConfiguration.customSoundForIncomingMessages {
                cometChatMessages.set(customSoundForIncomingMessages: customSoundForIncomingMessages)
            }
            
            if let customSoundForOutgoingMessages =  messagesConfiguration.customSoundForOutgoingMessages {
                cometChatMessages.set(customSoundForOutgoingMessages: customSoundForOutgoingMessages)
            }
        }
        
        cometChatMessages.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(cometChatMessages, animated: true)
    }
}
