$(document).ready(function() {
  // --- Navegación de tabs ---
  $(".tab-content").hide();
  $("#perfil").show();

  $(".navbar-item a").click(function(e) {
    e.preventDefault();
    $(".tab-content").hide();
    var target = $(this).data("target");
    $("#" + target).show();
  });

  // --- Cuadro de bienvenida ---
  $("#close-box").on("click", function() {
    $("#welcome-box").fadeOut();
  });

  $("#hide-forever").on("click", function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).attr("href"),
      type: "PATCH",
      dataType: "json",
      success: function() {
        $("#welcome-box").fadeOut();
      },
      error: function() {
        alert("Hubo un problema al guardar tu preferencia.");
      }
    });
  });
});

