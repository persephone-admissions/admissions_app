$(document).ready(function() {
  $('button.new.question').click(function(event) {
    console.log('clicked new button');
    console.log(event);
    var questionnaire_id = $(event.target).data("questionnaireid");
    console.log(questionnaire_id);
    var url = "questionnaires/" + questionnaire_id +  "/questions"
    console.log(url);
    var qContent = $('input.new').val();
    jQuery.ajax({
      url: "/questionnaires/" + questionnaire_id +  "/questions",
      method: "POST",
      data: {content: qContent},
      dataType: "json",
      success: function(data){
        if (data.created) {
          $('input.new').val('');
          var newDiv = "<div><p>"+ qContent + "</p></div>"
          $(newDiv).appendTo('.questions');
          console.log("Question successfully added");
        } else {
          console.log("Not added");
        }
      }, 
      error: function(error) {
        console.log(error);
      }
    });
  });
});

var addQuestionToPage = function(qID, qContent) {
  var $newDiv = $('<div>');
  $newDiv.content
};