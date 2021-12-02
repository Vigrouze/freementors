import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["button", "body"]

  connect() {
    console.log(this.buttonTarget)
  }
  toggle() {
    this.bodyTarget.classList.toggle("d-none")
  }
}
