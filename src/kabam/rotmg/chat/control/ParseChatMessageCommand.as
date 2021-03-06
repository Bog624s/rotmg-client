﻿package kabam.rotmg.chat.control {
import com.company.assembleegameclient.parameters.Parameters;

import kabam.rotmg.account.core.Account;

import kabam.rotmg.appengine.api.AppEngineClient;

import kabam.rotmg.chat.model.ChatMessage;
import kabam.rotmg.game.signals.AddTextLineSignal;
import kabam.rotmg.text.model.TextKey;
import kabam.rotmg.ui.model.HUDModel;

public class ParseChatMessageCommand {

    [Inject]
    public var data:String;
    [Inject]
    public var hudModel:HUDModel;
    [Inject]
    public var addTextLine:AddTextLineSignal;
    [Inject]
    public var client:AppEngineClient;
    [Inject]
    public var account:Account;


    public function execute():void {
        switch(this.data)
        {
            case "/help":
                this.addTextLine.dispatch(ChatMessage.make(Parameters.HELP_CHAT_NAME, TextKey.HELP_COMMAND));
                break;
            default:
                this.hudModel.gameSprite.gsc_.playerText(this.data);
        }
    }


}
}//package kabam.rotmg.chat.control
