function addItem(name, category) {
  var safeName = $("<div>").text(name).html();
  var li = $("<li>")
    .attr("data-category", category)
    .html(
      '<div class="item-left"><span><strong>' +
        safeName +
        '</strong></span><span class="meta">(' +
        category +
        ")</span></div>" +
        '<div><a href="#" class="remove">Remover</a></div>'
    );
  $("#item-list").append(li);
  updateFilterOptions();
  applyFilter();
}

function updateFilterOptions() {
  var categories = {};
  $("#item-list li").each(function () {
    var c = $(this).data("category");
    if (c) categories[c] = true;
  });

  var $filter = $("#filter");
  var selected = $filter.val() || "all";
  $filter.find("option").not('[value="all"]').remove();

  Object.keys(categories)
    .sort()
    .forEach(function (cat) {
      var label = cat;
      $filter.append($("<option>").val(cat).text(label));
    });

  if ($('#filter option[value="' + selected + '"]').length) {
    $filter.val(selected);
  } else {
    $filter.val("all");
  }
  toggleEmptyMsg();
}

function applyFilter() {
  var cat = $("#filter").val();
  if (cat === "all") {
    $("#item-list li").show();
  } else {
    $("#item-list li").each(function () {
      $(this).toggle($(this).data("category") === cat);
    });
  }
  toggleEmptyMsg();
}

function toggleEmptyMsg() {
  if ($("#item-list li:visible").length === 0) {
    $("#empty-msg").show();
  } else {
    $("#empty-msg").hide();
  }
}

$(document).ready(function () {
  updateFilterOptions();

  $("#add-form").on("submit", function (e) {
    e.preventDefault();
    var name = $("#item-name").val().trim();
    var category = $("#item-category").val();
    if (!name || !category) {
      alert("Preencha nome e categoria.");
      return;
    }
    addItem(name, category);
    $("#item-name").val("");
  });

  $("#item-list").on("click", "a.remove", function (e) {
    e.preventDefault();
    $(this)
      .closest("li")
      .fadeOut(150, function () {
        $(this).remove();
        updateFilterOptions();
      });
  });

  $("#filter").on("change", applyFilter);

  $("#item-name").on("keydown", function (e) {
    if (e.key === "Enter") {
      e.preventDefault();
      $("#add-form").submit();
    }
  });
});
