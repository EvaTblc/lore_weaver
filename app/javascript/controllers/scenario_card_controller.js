import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scenario-card"
export default class extends Controller {
  static targets = ["description", "icon", "hint"]

  connect() {
    this.isOpen = false
    console.log("Scenario card controller connected", this.element)
  }

  toggle(event) {
    event.preventDefault()
    console.log("Toggle clicked", this.element)

    if (this.isOpen) {
      // Fermer
      this.descriptionTarget.style.maxHeight = '0'
      this.descriptionTarget.style.padding = '0'
      this.iconTarget.textContent = '▶'
      this.hintTarget.style.display = 'block'
      this.isOpen = false
      console.log("Closed")
    } else {
      // Ouvrir
      this.descriptionTarget.style.maxHeight = '500px'
      this.descriptionTarget.style.padding = '0 2rem 1.5rem 2rem'
      this.iconTarget.textContent = '▼'
      this.hintTarget.style.display = 'none'
      this.isOpen = true
      console.log("Opened")
    }
  }
}
