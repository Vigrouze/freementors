import { Controller } from "stimulus"


export default class extends Controller {
  static targets = ['items'];
  static values = {
    url: String
  }

  refresh(e) {
    const url = `${this.urlValue}?tag=${e.target.innerText}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.itemsTarget.outerHTML = data;
      })
  }
}
