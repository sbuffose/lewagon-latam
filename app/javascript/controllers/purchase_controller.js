import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["wallet", "modal", "real", "original", "description", "hours", "title", "restriction", "dates", "time"]
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

  download(event) {
    event.preventDefault()

    fbq('trackCustom', 'descarga_syllabus_cursos');
    gtag('event', 'descarga_syllabus_cursos');

    window.open(event.currentTarget.href, '_blank').focus();
  }

  syllabus(event) {
    event.preventDefault()

    fbq('trackCustom', 'descarga_syllabus_bootcamp');
    gtag('event', 'descarga_syllabus_bootcamp');

    window.open(event.currentTarget.href, '_blank').focus();
  }

  launch(event) {
    event.preventDefault()

    fbq('trackCustom', 'interes_bootcamp');
    gtag('event', 'interes_bootcamp');

    window.open(event.currentTarget.href, '_blank').focus();
  }

  contact(event) {
    event.preventDefault()

    fbq('trackCustom', 'contacto');
    gtag('event', 'contacto');

    window.open(event.currentTarget.href, '_blank').focus();
  }

  submit() {
    this.walletTarget.querySelector("button").click()
  }

  enable() {
    this.modalTarget.classList.remove("hidden")
  }

  disable() {
    this.modalTarget.classList.add("hidden")
    this.walletTarget.innerHTML = ""
  }

  buy(event) {
    this.enable()

    fbq('trackCustom', event.currentTarget.dataset.purchaseTrigger);
    gtag('event', event.currentTarget.dataset.purchaseTrigger);

    const mp = new MercadoPago('APP_USR-a0340b73-99d3-4c67-af70-cda1c2b549a5');

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

    if (event.currentTarget.dataset.purchaseFormat === "sync") {
      this.datesTarget.innerText = `Fechas: ${event.currentTarget.dataset.purchaseDates}`
      this.timeTarget.innerText = `Horario: ${event.currentTarget.dataset.purchaseTime}`
    } else {
      this.datesTarget.innerText = ""
      this.timeTarget.innerText = ""
    }
  }
}
