import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="chat-scroll"
export default class extends Controller {
    connect() {
        this.observeChatUpdates();
        this.scrollToBottom();
    }

    observeChatUpdates() {
        const observer = new MutationObserver(() => {
            this.update();
        });

        observer.observe(this.element.querySelector("#messages"), {
            childList: true,
        });

        this.mutationObserver = observer;
    }

    scrollToBottom() {
        this.element.scrollTop = 9999999; // max it out
    }

    update() {
        if (this.isAtBottom()) {
            this.scrollToBottom();
        }
        const scrollPosition = this.element.scrollHeight - (this.element.scrollTop + this.element.clientHeight);
    }

    isAtBottom() {
        const threshold = 250;
        const scrollPosition = this.element.scrollHeight - (this.element.scrollTop + this.element.clientHeight);
        return scrollPosition <= threshold;
    }

    disconnect() {
        this.mutationObserver.disconnect();
    }
}
