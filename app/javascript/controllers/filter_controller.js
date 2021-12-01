import { Controller } from "stimulus"
import "jquery-bar-rating";
import $ from 'jquery';

export default class extends Controller {
  static targets = ['mentors', 'checkbox', 'select'];
  static values = {
    url: String
  }

  connect() {
    const that = this;
    $(this.selectTarget).barrating({
      theme: 'css-stars',
      onSelect: function (event) {
        that.refresh()
      }
    });
  }

  refresh(e) {
    console.log(this.selectTarget.value)
    // si rating est rempli je viens l'ajouter, sinon je ne rajoute pas
    // if rating.nil?
    let rating = null
      if (this.selectTarget.value === null) {
        rating;
      } else {
        rating = `&rating=${this.selectTarget.value}`;
      }
      return rating;

    // let rating = `&rating=${this.selectTarget.value}`
    let checkBoxes = this.checkboxTargets
    const result = checkBoxes.filter(checkbox => checkbox.checked == true).map(checkbox => checkbox.value)
    const url = `${this.urlValue}?tags=${result}${rating}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.mentorsTarget.outerHTML = data;
      })
  }
}
