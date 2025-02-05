import React, { useState } from 'react';
import './Chatbot.css';

const Chatbot = () => {
  const [messages, setMessages] = useState([
    { text: "Hello! How can I assist you?", sender: "bot" },
  ]);
  const [input, setInput] = useState("");

  const handleSend = () => {
    if (input.trim() === "") return;
    const userMessage = { text: input, sender: "user" };
    setMessages([...messages, userMessage]);

    const botResponse = getBotResponse(input);
    setTimeout(() => {
      setMessages((prev) => [...prev, { text: botResponse, sender: "bot" }]);
    }, 1000);
    setInput("");
  };

  const getBotResponse = (message) => {
    const lowerCaseMessage = message.toLowerCase();
    if (lowerCaseMessage.includes("hello")) {
      return "Hi there! How can I help you today?";
    } else if (lowerCaseMessage.includes("help")) {
      return "Sure, I'm here to help! What do you need assistance with?";
    } else if (lowerCaseMessage.includes("course")) {
      return "We offer various courses on digital skills. Which course are you interested in?";
    } else if (lowerCaseMessage.includes("price")) {
      return "The prices for our courses vary. Please check the courses section for more details.";
    } else if (lowerCaseMessage.includes("thank you")) {
      return "You're welcome! If you have any other questions, feel free to ask.";
    } else {
      return "I'm still learning! Can you please rephrase your question?";
    }
  };

  return (
    <div className="chatbot-container">
      <div className="chatbox">
        {messages.map((msg, index) => (
          <div key={index} className={msg.sender === "bot" ? "bot-message" : "user-message"}>
            {msg.text}
          </div>
        ))}
      </div>
      <div className="input-container">
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          placeholder="Ask something..."
        />
        <button onClick={handleSend}>Send</button>
      </div>
    </div>
  );
};

export default Chatbot;