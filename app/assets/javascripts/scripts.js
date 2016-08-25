$(document).ready(function() {
  // Set Countdown Timer
  var deadline = new Date(Date.parse(new Date()) + 15 * 24 * 60 * 60 * 1000);
  initializeClock('countdown-div', deadline);

  $('.ui.dropdown').dropdown();

  $('.ui.sidebar').sidebar('attach events', '.toc.item');

  $('.tabular.menu .item').tab()
;
});
