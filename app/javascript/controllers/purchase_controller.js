import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["wallet", "modal", "real", "original", "description", "hours", "title", "restriction"]
  static values = {
    courseName: String,
    coursePrice: String,
    courseDescription: String,
    preferenceId: String,
    OriginalPrice: String,
    RealPrice: String,
    Description: String,
    Hours: String,
    Restriction: String,
    Title: String
  }

  connect() {
  }

  submit() {
    this.walletTarget.querySelector("button").click()
  }

  enable() {
    this.modalTarget.classList.remove("hidden")
  }

  disable() {
    this.modalTarget.classList.add("hidden")
  }

  buy(event) {
    this.enable()

    const mp = new MercadoPago('APP_USR-b627c34d-03c5-4ebc-93b8-82caba010cbc');

    mp.bricks().create("wallet", "wallet_container", {
      initialization: {
        preferenceId: event.currentTarget.dataset.purchasePreferenceId,
      },
      customization: {
        texts: {
          valueProp: 'smart_option',
        },
      },
    })

    this.realTarget.innerText = `${event.currentTarget.dataset.purchaseRealPrice} USD/mes`
    this.originalTarget.innerText = `${event.currentTarget.dataset.purchaseOriginalPrice} USD/mes`
    this.descriptionTarget.innerText = event.currentTarget.dataset.purchaseCourseDescription
    this.hoursTarget.innerText = `${event.currentTarget.dataset.purchaseHours} horas`
    this.restrictionTarget.innerText = event.currentTarget.dataset.purchaseRestriction
    this.titleTarget.innerText = event.currentTarget.dataset.purchaseCourseName
  }
}
