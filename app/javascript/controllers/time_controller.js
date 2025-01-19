import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="time"
export default class extends Controller {
  static targets = ["time"]; // wow

  connect() {
    const REFRESH_TIME = 1_000;
    console.log("Connected the 'ago' time refresher with timeout of " + REFRESH_TIME + " milliseconds.");
    this.interval = setInterval(() => this.refresh(), REFRESH_TIME);
  }

  disconnect() {
    console.log("Disconnected the 'ago' time refresher. Clearing interval timer.");
    clearInterval(this.interval);
  }

  refresh() {
    const now = new Date();
    console.log("Refreshing the 'ago' times...");
    this.timeTargets.forEach((chatMessage) => {
      const timestamp = new Date(chatMessage.dataset.timestamp);
      chatMessage.textContent = this.timeAgoInWords(timestamp, now);
    })
  }

  timeAgoInWords(date, now) {
    const seconds = Math.round((now - date) / 1000); // Round to the nearest second

    if (seconds < 60) return "just now";
    if (seconds < 120) return "1 minute ago";

    const minutes = Math.round(seconds / 60); // Round to the nearest minute
    if (minutes < 60) return `${minutes} minutes ago`;

    const hours = Math.round(minutes / 60); // Round to the nearest hour
    if (hours < 24) return `${hours} ${hours === 1 ? "hour" : "hours"} ago`;

    const days = Math.round(hours / 24); // Round to the nearest day
    if (days < 30) return `${days} ${days === 1 ? "day" : "days"} ago`;

    const months = Math.round(days / 30); // Approximate months
    if (months < 12) return `${months} ${months === 1 ? "month" : "months"} ago`;

    const years = Math.round(days / 365); // Approximate years
    return `${years} ${years === 1 ? "year" : "years"} ago`;
  }
}
