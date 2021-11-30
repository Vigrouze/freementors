import { Controller } from "stimulus";
import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)


export default class extends Controller {
  static targets = ['select'];

  connect(){
    // console.log(targets)
    this.selectTargets.forEach((select) => {
      // console.log(select)
      $(select).barrating({
        theme: 'css-stars'
      });
    })
  }
}
