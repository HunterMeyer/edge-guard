$(document).ready(function() {
  var deadline = new Date('December 10, 2016');
  initializeClock('countdown-div', deadline);

  $('.ui.dropdown').dropdown();

  $('.ui.sidebar').sidebar('attach events', '.toc.item');

  $('.tabular.menu .item').tab();
});
