//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require lightbox.min
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  // Handle navbar item active state.
  document.querySelector("nav").addEventListener("click", ({ target }) => {
    document.querySelectorAll("nav a").forEach(a => {
      a.classList.remove("is-active");
    });
    target.classList.add("is-active");
  });

  var lightbox = new Lightbox();
  lightbox.load();
});
