var tabLinks = new Array();
var bodyPartSections = new Array();

$('.body-part-sections ul#tabs li a').click(function(e) {
  var linkClicked = $(this).attr("href");
  switchTab(linkClicked);
  e.preventDefault();
});

function switchTab(linkClicked) {
  $('.body-part-sections ul#tabs li').removeClass('current');
  $('.body-part-section').removeClass('current');
  console.log($.inArray(linkClicked, tabLinks));
  tabLinks[linkClicked].addClass('current');
  bodyPartSections[linkClicked].addClass('current');
}

$(document).ready(function() {
  var tabs = $('.body-part-sections ul#tabs li');
  tabs.each(function() {
    var id = $(this).find("a").attr("href")
    tabLinks[id] = $(this);
    bodyPartSections[id] = $(id);
  });
  //console.log(bodyPartSections);
//  console.log(firstTab.find("a").attr("href"));
  //console.log(tabLinks);
});
