import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  updateNavbar() {
    const page = window.location.pathname
    let threshold
    if (page == '/dashboard') {
      threshold = 0
    } else {
      threshold = 100
    }
    if (window.scrollY >= threshold) {
      this.element.classList.add('white-bg');
    } else {
      this.element.classList.remove('white-bg');
    }
  }
}
