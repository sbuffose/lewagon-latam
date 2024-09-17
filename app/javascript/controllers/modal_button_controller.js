import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["button", "modal"]

  enable() {
    console.log("click")
    console.log(this.modalTarget)
    this.modalTarget.classList.remove('hidden');
  }

  disable() {
    console.log("click")
    this.modalTarget.classList.add('hidden')
  }
}
