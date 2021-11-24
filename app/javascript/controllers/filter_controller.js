import { Controller } from "stimulus"


export default class extends Controller {
  static targets = 'items';
  static values = {
    url: String
  }

  connect() {
    console.log("connected")
    console.log(this.urlValue)
  }

  refresh(e) {
    console.log("filterclick")
    console.log(e.target)
  }
}
