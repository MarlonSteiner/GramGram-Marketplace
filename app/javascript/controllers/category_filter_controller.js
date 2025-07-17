import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [""]

  filterCategory(event) {
    event.preventDefault()

    // Update active state
    this.element.querySelectorAll('.category-item').forEach(item => {
      item.classList.remove('active')
    })
    event.currentTarget.classList.add('active')

    // Get category and filter carousel
    const category = event.currentTarget.dataset.category
    const carouselController = this.application.getControllerForElementAndIdentifier(
      document.querySelector('[data-controller="granny-carousel"]'),
      'granny-carousel'
    )

    if (carouselController) {
      carouselController.filterByCategory(category)
    }
  }
}
