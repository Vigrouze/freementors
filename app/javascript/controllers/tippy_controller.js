import tippy from 'tippy.js'
import { Controller } from "stimulus"


export default class extends Controller {
  static targets = ["avatar"]
  connect() {
    this.avatarTargets.forEach((avatar) => {
      tippy(avatar, {
        content: avatar.dataset.content
      })
    });
  }
}
