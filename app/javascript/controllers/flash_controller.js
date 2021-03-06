import { Controller } from "stimulus";
import Swal from 'sweetalert2';

export default class extends Controller {
  static values = {
    text: String,
    type: String,
  }
  connect() {
    const Toast = Swal.mixin({
      toast: true,
      position: 'bottom-end',
      showConfirmButton: false,
      timer: 2000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })

    Toast.fire({
      icon: this.typeValue,
      title: this.textValue
    })
}
}
