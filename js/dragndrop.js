var allParts = ['usb1', 'usb2', 'ethernet', 'usbethernetcontroller',
  'videoaudio', 'cameracsi', 'cpugpu', 'hdmi', 'microusb', 'displaydsi'
];

var origXPos = [];
var origYPos = [];
var attempts = 0;
var correct = 0;

var captions = [];
captions[0] = "USB Test 1";
captions[1] = "USB Test 2";
captions[2] = "Ethernet Test";
captions[3] = "USB and Ethernet Controller";
captions[4] = "Video and Audio Controller";
captions[5] = "Camera CSI";
captions[6] = "CPU / GPU";
captions[7] = "HDMI";
captions[8] = "Micro USB";
captions[9] = "Display DSI";

function dragndropInit() {
  $("#detail")
    .hide();
  $("#shareCon")
    .hide();
  $(".draggable")
    .draggable({
      revert: "valid"
    });
  $(".droppable")
    .droppable({
      hoverClass: "boxHover",
      drop: function (event, ui) {
        $(this)
        var dragid = ui.draggable.attr("id").substring(1, ui.draggable.attr(
          "id").length);
        var dropid = $(this).attr("id").substring(1, $(this).attr("id").length);
        var dataid = $(this).attr("data-id")
        if(dragid == dropid) {
          ui.draggable.css("visibility", "hidden");

          // Counts number of times
          attempts++;
          correct++;
          $("#numAttempts").text(attempts);
          $("#numCorrect").text(correct);
          showInfo(dataid);

          $(this).click(function () {
            showInfo(dataid);
          });

          if(correct == 10) {
            $("#share").text("It took you " + attempts +
              " attempts to match them all!");
            $("#shareCon").show();
          }

        } else {
          attempts++;
          $("#numAttempts").text(attempts);
        }
      }
    });

  $(".droppable2").droppable();

  $("#detail").click(function () {
    $("#detail").hide();
    $("#detail").animate({
      opacity: '0'
    }, 500);
  });
}

function showInfo(which) {
  $("#detail").show();
  $("#detail").animate({
    opacity: '1'
  }, 500);
  $("#detail #desc").text(captions[which]);

  var img = new Image();
  img.src = "imgages/real-" + allParts[which] + ".jpg";
  $("#detail #photoCon").empty();
  $("#detail #photoCon").append(img);
}


$(document)
  .ready(function () {
    dragndropInit();
  });
