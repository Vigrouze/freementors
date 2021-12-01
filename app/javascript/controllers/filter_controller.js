import { Controller } from "stimulus"
import "jquery-bar-rating";
import $ from 'jquery';

export default class extends Controller {
  static targets = ['mentors', 'checkbox', 'select', 'tickbox'];
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
    // rating
    console.log(this.tickboxTarget.checked)
    let rating = null
      if (this.selectTarget.value === null) {
        rating;
      } else {
        rating = `&rating=${this.selectTarget.value}`;
      }

    //mission

    let mission = null
      if (this.tickboxTarget.checked) {
          mission = `&missions=1`;
        } else {
          mission = `&missions=0`;;
      }


    let checkBoxes = this.checkboxTargets
    const result = checkBoxes.filter(checkbox => checkbox.checked == true).map(checkbox => checkbox.value)
    const url = `${this.urlValue}?tags=${result}${rating}${mission}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        this.mentorsTarget.outerHTML = data;
      })
  }
}
