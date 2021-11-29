import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['button'];

  connect() {
    console.log(this.element);
    console.log(this.buttonTarget);
  }
  edit() {
    console.log('edit')
    fetch
  }
  create() {
    console.log('create')
  }
}
