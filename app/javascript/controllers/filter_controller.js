import { Controller } from "stimulus"


export default class extends Controller {
  static targets = ['mentors', 'checkbox'];
  static values = {
    url: String
  }

  refresh(e) {
    let checkBoxes = this.checkboxTargets
    const result = checkBoxes.filter(checkbox => checkbox.checked == true).map(checkbox => checkbox.value)
    const url = `${this.urlValue}?tags=${result}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.mentorsTarget.outerHTML = data;
      })
  }
}
