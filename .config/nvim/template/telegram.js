const TelegramBot = require('node-telegram-bot-api');
const bot = new TelegramBot("", { polling: true });

bot.on('message', (msg) => {
    const chatId = msg.chat.id;
    const messageText = msg.text;

    if (messageText === '/start') {
        bot.sendMessage(chatId, 'Welcome! How can I assist you today?');
    } else if (messageText === '/help') {
        bot.sendMessage(chatId, 'Here are some commands you can use:\n/start - Start the bot\n/help - Get help');
    }
});
