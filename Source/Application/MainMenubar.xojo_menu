#tag Menu
Begin Menu MainMenubar
   Begin MenuItemFileMenu FileMenu
      SpecialMenu = 0
      Text = "#MenuItemFileMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin CocoaMenuItemClose FileClose
         SpecialMenu = 0
         Text = "#CocoaMenuItemClose.LocalizedText"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 0
         AutoEnable = True
         Visible = True
      End
      Begin CocoaMenuItemPageSetup CocoaFilePageSetup
         SpecialMenu = 0
         Text = "#CocoaMenuItemPageSetup.LocalizedText"
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+Shift+P"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin CocoaMenuItemPrint CocoaFilePrint
         SpecialMenu = 0
         Text = "#CocoaMenuItemPrint.LocalizedText"
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+P"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 1
         AutoEnable = True
         Visible = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItemEditMenu EditMenu
      SpecialMenu = 0
      Text = "#MenuItemEditMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin CocoaMenuItemUndo EditUndo
         SpecialMenu = 0
         Text = "#CocoaMenuItemUndo.LocalizedText"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin CocoaMenuItemRedo EditRedo
         SpecialMenu = 0
         Text = "#CocoaMenuItemRedo.LocalizedText"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Shift+Z"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 2
         AutoEnable = True
         Visible = True
      End
      Begin CocoaMenuItemCut EditCut
         SpecialMenu = 0
         Text = "#CocoaMenuItemCut.LocalizedText"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin CocoaMenuItemCopy EditCopy
         SpecialMenu = 0
         Text = "#CocoaMenuItemCopy.LocalizedText"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin CocoaMenuItemPaste EditPaste
         SpecialMenu = 0
         Text = "#CocoaMenuItemPaste.LocalizedText"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin CocoaMenuItemPasteAndMatchStyle EditPasteAndMatchStyle
         SpecialMenu = 0
         Text = "#CocoaMenuItemPasteAndMatchStyle.LocalizedText"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+Shift+Option+V"
         MenuModifier = True
         AltMenuModifier = True
         MacOptionKey = True
         AutoEnable = False
         Visible = True
      End
      Begin CocoaMenuItemDelete EditClear
         SpecialMenu = 0
         Text = "#CocoaMenuItemDelete.LocalizedText"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin CocoaMenuItemComplete EditComplete
         SpecialMenu = 0
         Text = "#CocoaMenuItemComplete.LocalizedText"
         Index = -2147483648
         ShortcutKey = "ESC"
         Shortcut = "Option+ESC"
         MacOptionKey = True
         AutoEnable = False
         Visible = True
      End
      Begin CocoaMenuItemSelectAll EditSelectAll
         SpecialMenu = 0
         Text = "#CocoaMenuItemSelectAll.LocalizedText"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 3
         AutoEnable = True
         Visible = True
      End
      Begin CocoaMenuItemInsert EditInsert
         SpecialMenu = 0
         Text = "#CocoaMenuItemInsert.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Visible = True
         Begin CocoaMenuItemInsertLineBreak InsertLineBreak
            SpecialMenu = 0
            Text = "#CocoaMenuItemInsertLineBreak.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemInsertParagraphBreak InsertParagraphBreak
            SpecialMenu = 0
            Text = "#CocoaMenuItemInsertParagraphBreak.LocalizedText"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin CocoaMenuItemInsertPageBreak InsertPageBreak
            SpecialMenu = 0
            Text = "#CocoaMenuItemInsertPageBreak.LocalizedText"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
      End
      Begin CocoaMenuItemEditLink EditEditLink
         SpecialMenu = 0
         Text = "#CocoaMenuItemEditLink.LocalizedText"
         Index = -2147483648
         ShortcutKey = "K"
         Shortcut = "Cmd+K"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 4
         AutoEnable = True
         Visible = True
      End
      Begin CocoaMenuItemFindParent EditFind
         SpecialMenu = 0
         Text = "#CocoaMenuItemFindParent.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Visible = True
         Begin CocoaMenuItemFind FindFind
            SpecialMenu = 0
            Text = "#CocoaMenuItemFind.LocalizedText"
            Index = -2147483648
            ShortcutKey = "F"
            Shortcut = "Cmd+F"
            MenuModifier = True
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemFindNext FindFindNext
            SpecialMenu = 0
            Text = "#CocoaMenuItemFindNext.LocalizedText"
            Index = -2147483648
            ShortcutKey = "G"
            Shortcut = "Cmd+G"
            MenuModifier = True
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemFindPrevious FindFindPrevious
            SpecialMenu = 0
            Text = "#CocoaMenuItemFindPrevious.LocalizedText"
            Index = -2147483648
            ShortcutKey = "G"
            Shortcut = "Cmd+Shift+G"
            MenuModifier = True
            AltMenuModifier = True
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemUseSelectionForFind UntitledItem2
            SpecialMenu = 0
            Text = "#CocoaMenuItemUseSelectionForFind.LocalizedText"
            Index = -2147483648
            ShortcutKey = "E"
            Shortcut = "Cmd+E"
            MenuModifier = True
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemJumpToSelection UntitledItem3
            SpecialMenu = 0
            Text = "#CocoaMenuItemJumpToSelection.LocalizedText"
            Index = -2147483648
            ShortcutKey = "J"
            Shortcut = "Cmd+J"
            MenuModifier = True
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemSelectLine UntitledItem4
            SpecialMenu = 0
            Text = "#CocoaMenuItemSelectLine.LocalizedText"
            Index = -2147483648
            ShortcutKey = "L"
            Shortcut = "Cmd+L"
            MenuModifier = True
            AutoEnable = False
            Visible = True
         End
      End
      Begin CocoaMenuItemEditSpelling EditSpellingandGrammar
         SpecialMenu = 0
         Text = "#CocoaMenuItemEditSpelling.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Visible = True
         Begin CocoaMenuItemShowSpelling SpellingandGrammarShowSpellingandGrammar
            SpecialMenu = 0
            Text = "#CocoaMenuItemShowSpelling.LocalizedText"
            Index = -2147483648
            ShortcutKey = ":"
            Shortcut = "Cmd+:"
            MenuModifier = True
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemCheckDocumentNow SpellingandGrammarCheckDocumentNow
            SpecialMenu = 0
            Text = "#CocoaMenuItemCheckDocumentNow.LocalizedText"
            Index = -2147483648
            ShortcutKey = ";"
            Shortcut = "Cmd+;"
            MenuModifier = True
            AutoEnable = False
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 5
            AutoEnable = True
            Visible = True
         End
         Begin CocoaMenuItemCheckSpellingWhileTyping SpellingandGrammarCheckSpellingWhileTyping
            SpecialMenu = 0
            Text = "#CocoaMenuItemCheckSpellingWhileTyping.LocalizedText"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin CocoaMenuItemCheckGrammarWithSpelling SpellingandGrammarCheckGrammarWithSpelling
            SpecialMenu = 0
            Text = "#CocoaMenuItemCheckGrammarWithSpelling.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemCorrectSpelling SpellingandGrammarCorrectSpellingAutomatically
            SpecialMenu = 0
            Text = "#CocoaMenuItemCorrectSpelling.LocalizedText"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
      End
      Begin CocoaMenuItemEditSubstitutions EditSubstitutions
         SpecialMenu = 0
         Text = "#CocoaMenuItemEditSubstitutions.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Visible = True
         Begin CocoaMenuItemShowSubstitutions SubstitutionsShowSubstitutions
            SpecialMenu = 0
            Text = "#CocoaMenuItemShowSubstitutions.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
         Begin MenuItem MenuSeparator
            SpecialMenu = 0
            Text = "-"
            Index = 6
            AutoEnable = True
            Visible = True
         End
         Begin CocoaMenuItemSmartCopyPaste SubstitutionsSmartCopyPaste
            SpecialMenu = 0
            Text = "#CocoaMenuItemSmartCopyPaste.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemSmartQuotes SubstitutionsSmartQuotes
            SpecialMenu = 0
            Text = "#CocoaMenuItemSmartQuotes.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemSmartDashes SubstitutionsSmartDashes
            SpecialMenu = 0
            Text = "#CocoaMenuItemSmartDashes.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemSmartLinks SubstitutionsSmartLinks
            SpecialMenu = 0
            Text = "#CocoaMenuItemSmartLinks.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemDataDetectors SubstitutionsDataDetectors
            SpecialMenu = 0
            Text = "#CocoaMenuItemDataDetectors.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemTextReplacement SubstitutionsTextReplacement
            SpecialMenu = 0
            Text = "#CocoaMenuItemTextReplacement.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
      End
      Begin CocoaMenuItemEditTransformations EditTransformations
         SpecialMenu = 0
         Text = "#CocoaMenuItemEditTransformations.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Visible = True
         Begin CocoaMenuItemMakeUppercase TransformationsMakeUpperCase
            SpecialMenu = 0
            Text = "#CocoaMenuItemMakeUppercase.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemMakeLowercase TransformationsMakeLowerCase
            SpecialMenu = 0
            Text = "#CocoaMenuItemMakeLowercase.LocalizedText"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin CocoaMenuItemCapitalize TransformationsCapitalize
            SpecialMenu = 0
            Text = "#CocoaMenuItemCapitalize.LocalizedText"
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
      End
      Begin CocoaMenuItemEditSpeech EditSpeech
         SpecialMenu = 0
         Text = "#CocoaMenuItemEditSpeech.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         SubMenu = True
         Visible = True
         Begin CocoaMenuItemStartSpeaking SpeechStartSpeaking
            SpecialMenu = 0
            Text = "#CocoaMenuItemStartSpeaking.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
         Begin CocoaMenuItemStopSpeaking SpeechStopSpeaking
            SpecialMenu = 0
            Text = "#CocoaMenuItemStopSpeaking.LocalizedText"
            Index = -2147483648
            AutoEnable = False
            Visible = True
         End
      End
   End
   Begin MenuItemViewMenu ViewMenu
      SpecialMenu = 0
      Text = "#MenuItemViewMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin CocoaMenuItemShowToolbar ViewToggleToolbar
         SpecialMenu = 0
         Text = "#CocoaMenuItemShowToolbar.LocalizedTextShow"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin CocoaMenuItemCustomizeToolbar ViewCustomizeToolbar
         SpecialMenu = 0
         Text = "#CocoaMenuItemCustomizeToolbar.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 16
         AutoEnable = True
         Visible = True
      End
      Begin CocoaMenuItemToggleFullscreen ViewToggleFullscreen
         SpecialMenu = 0
         Text = "#CocoaMenuItemToggleFullscreen.LocalizedTextEnterFullscreen"
         Index = -2147483648
         ShortcutKey = "F"
         Shortcut = "Cmd+Control+F"
         MenuModifier = True
         MacControlKey = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItemWindowMenu WindowMenu
      SpecialMenu = 0
      Text = "#MenuItemWindowMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItemMinimize WindowMinimize
         SpecialMenu = 0
         Text = "#MenuItemMinimize.LocalizedText"
         Index = -2147483648
         ShortcutKey = "M"
         Shortcut = "Cmd+M"
         MenuModifier = True
         AutoEnable = False
         Visible = True
      End
      Begin MenuItemZoom AppWindowMenuTitleZoom
         SpecialMenu = 0
         Text = "#MenuItemZoom.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 19
         AutoEnable = True
         Visible = True
      End
      Begin MenuItemBringAllToFront AppWindowMenuTitleBringAllToFront
         SpecialMenu = 0
         Text = "#MenuItemBringAllToFront.LocalizedText"
         Index = -2147483648
         AutoEnable = False
         Visible = True
      End
      Begin MenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = 20
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItemHelpMenu HelpMenu
      SpecialMenu = 0
      Text = "#MenuItemHelpMenu.LocalizedText"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItemAbout ApplicationAbout
         SpecialMenu = 0
         Text = "#MenuItemAbout.LocalizedText"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin ApplicationMenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItemPreferences ApplicationPreferences
         SpecialMenu = 0
         Text = "#MenuItemPreferences.LocalizedText"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin ApplicationMenuItem MenuSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItemCheckForUpdates ApplicationCheckForUpdates
         SpecialMenu = 0
         Text = "#MenuItemCheckForUpdates.LocalizedText"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItemDonate ApplicationDonate
         SpecialMenu = 0
         Text = "#MenuItemDonate.LocalizedText"
         Index = 0
         AutoEnable = True
         Visible = True
      End
      Begin HelpMenuItemSendFeedback HelpSendFeedback
         SpecialMenu = 0
         Text = "#HelpMenuItemSendFeedback.LocalizedText"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin HelpMenuItemVisitWebsite HelpVisitWebsite
         SpecialMenu = 0
         Text = "#HelpMenuItemVisitWebsite.LocalizedText"
         Index = 0
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin HelpMenuItemDebug HelpDebug
         SpecialMenu = 0
         Text = "#HelpMenuItemDebug.LocalizedText"
         Index = -2147483648
         AutoEnable = True
         Visible = False
      End
   End
End
#tag EndMenu
