import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  close() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

  submit(event) {
    if (event.detail.success) {
      this.close()
    }
  }

  closeWithKeyboard(event) {
    if (event.code == "Escape") {
      this.close()
    }
  }

  closeBackground(event) {
    if (event && this.element !== event.target) {
      return
    }
    this.close()
  }
  
  submitUserProfile(event) {
    if (event.detail.success) {
      this.close()
      this.redirectWhenSignedOut()
    }
  }

  redirectWhenSignedOut() {
    fetch("/api/current_user", { headers: { Accept: "application/json" } })
    .then(response => response.json())
    .then(data => {
      if (!data.signed_in) {
        window.location.href = "/users/sign_in"
      }
    })
    .catch(error => console.error("Error checking user:", error));
  }
}
