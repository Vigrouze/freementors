import { Controller } from "stimulus";
import { annotate } from 'rough-notation';

export default class extends Controller {
  static targets = ['text']
  connect() {
    console.log("Hello from Stimulus")
    console.log(this.textTarget)
    const annotation = annotate(this.textTarget, { type: 'highlight', strokeWidth: 3, color: '#fea93a', animationDuration: 1250 });
    annotation.show();
  }
}
