didScroll = true;

$(window).on("scroll", function () {
  // Aquí deberás escribir la lógica que modificará la barra
  didScroll = true;
});

setInterval(function () {
  if (didScroll) {
    didScroll = false;
    var sPos = $(window).scrollTop();
    console.log(sPos);
    var opacityLevel = Math.max(.8, 1-sPos/1000);
    $('.top-nav').css('opacity',opacityLevel);
  }
}, 250);