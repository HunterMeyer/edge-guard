$(document).ready(function() {
  $('.ui.dropdown').dropdown();

  $('.ui.sidebar').sidebar('attach events', '.toc.item');

  $('.tabular.menu .item').tab();
});
