import { Controller } from "stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { userId: Number }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "UserChannel" },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to user ${this.userIdValue}`)
  }

}
