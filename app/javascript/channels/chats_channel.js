import consumer from "channels/consumer"

consumer.subscriptions.create("ChatsChannel", {
  connected() {
    console.log('Connected to the server')
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    console.log('Disconnected')
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log('Received data ' + JSON.stringify(data))
    let el = document.createElement('li');
    el.innerHTML = data.message;
    document.getElementById('chats').appendChild(el)
  }
});