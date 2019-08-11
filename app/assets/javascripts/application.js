// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require lightbox
//= require_tree .

document.addEventListener("turbolinks:load", async () => {
  var lightbox = new Lightbox();
  lightbox.load({
    nextOnClick: false,
    onimageclick: image => {
      window.open(image.img.src, '_blank');
    },
  });

  for (const input of [...document.querySelectorAll('input[type=file]')]) {
    input.addEventListener('change', async (e) => {
      for (const f of e.target.files) {
        const reader = new FileReader();

        reader.onload = function() {
          const img = document.createElement('img');
          img.src = reader.result;
          img.width = '250';

          e.target
          .closest('div.previews-container')
          .querySelector('div.previews')
          .appendChild(img);
        }

        await reader.readAsDataURL(f);
      }
    });
  }

  for (const a of [...document.querySelectorAll('a[data-remote=true][data-method=delete]')]) {
    a.addEventListener('ajax:success', async ({ target }) => {
      target.closest('span.image-preview').remove();
    });
  }

});
