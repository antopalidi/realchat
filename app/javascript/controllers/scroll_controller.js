import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
    // start
    connect() {
        console.log("Connected");
        const messages = document.getElementById("messages");
        messages.addEventListener("DOMNodeInserted", this.resetScroll);
        this.resetScroll(messages);
    }

    // stop
    disconnect() {
        console.log("Disconnected");
    }

    //custom function
    resetScroll() {
        messages.scrollTop = messages.scrollHeight - messages.clientHeight
    }
}
