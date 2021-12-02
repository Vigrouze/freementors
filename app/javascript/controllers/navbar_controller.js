import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  updateNavbar() {
    if (window.scrollY >= 100) {
      this.element.classList.add('white-bg');
    } else {
      this.element.classList.remove('white-bg');
    }
  }
}
