import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["button", "body", "avatars"]

  connect() {
    // console.log(this.avatarsTarget)
  }
  toggle() {
    this.buttonTarget.classList.toggle("grey")
    this.avatarsTarget.classList.toggle("hidden")
    this.avatarsTarget.classList.add("animate__animated")
    this.avatarsTarget.classList.add("animate__fadeInUp")
  }
}
