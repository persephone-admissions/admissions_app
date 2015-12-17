$(document).ready(function() {
  $('button.new.question').click(function(event) {
    console.log('clicked new button');
    console.log(event);
    var questionnaire_id = $(event.target).data("questionnaireid");
    console.log(questionnaire_id);
    var url = "questionnaires/" + questionnaire_id +  "/questions"
    console.log(url);
    jQuery.ajax({
      url: "/questionnaires/" + questionnaire_id +  "/questions",
      method: "POST",
      data: {content: $('input.new').val()},
      dataType: "json",
      success: function(data){
        if (data.created) {
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