$(document).ready(function() {
  // Ocultar todas las secciones al inicio
  $(".tab-content").hide();

  // Mostrar solo Perfil al cargar
  $("#perfil").show();

  // Manejar clicks en la navbar
  $(".navbar-item a").click(function(e) {
    e.preventDefault();

    // Ocultar todas las secciones
    $(".tab-content").hide();

    // Mostrar la sección seleccionada
    var target = $(this).data("target");
    $("#" + target).show();
  });
});

