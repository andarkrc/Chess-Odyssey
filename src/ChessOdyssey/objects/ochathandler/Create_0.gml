chatMessages = [];
depth = -10;
max_message_display = 10;
chatMessages[max_message_display+1] = {
	chatMessage : "",
	messageSender : "",
	messageOwner : ""
};

can_display_chat = false;
if(global.orientation == "landscape") can_display_chat = true;
new_unseen_message = false;
///@function intChat
intChat = function(){
	var i = 0;
	for(i = 1; i <= max_message_display; i++)
	{
		chatMessages[i] = {
			chatMessage : "",
			messageSender : "",
			messageOwner : ""
		};
	}
}
intChat();
///@function addMessageInChat
///@param c_message
///@param m_sender
///@param m_owner
addMessageInChat = function(c_message, m_sender, m_owner){
	var j = 0;
	for(j = max_message_display-1; j >= 1; j--)
	{
		chatMessages[j+1].chatMessage = chatMessages[j].chatMessage;
		chatMessages[j+1].messageSender = chatMessages[j].messageSender;
		chatMessages[j+1].messageOwner = chatMessages[j].messageOwner;
	}
	chatMessages[1] = {
		chatMessage : c_message,
		messageSender : "<"+m_sender+">",
		messageOwner : m_owner
	};
}
if(global.orientation == "landscape")
{
	createChatMessageTextBox(room_width - 896 + 64, 128);
	with(createShowChatButton(room_width-896+64, 128-64-32))
	{
		width = 64;
		height = 64;
	}
}
else if(global.orientation == "portrait")
{
	with(createChatMessageTextBox(room_width - 896 + 64 - 896+128, 128+64))
	{
		height = 128;
		width = 896*2 - 64 - 192 -256;
	}
	createShowChatButton(room_width-256+48, 128+64);
}