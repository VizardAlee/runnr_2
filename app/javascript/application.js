// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import "@hotwired/stimulus"
import "@hotwired/stimulus-loading"
import "controllers"

Rails.start()

document.addEventListener("DOMContentLoaded", () => {
  alert("JavaScript is working!");
});
