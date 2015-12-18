$(document).ready(function() {
  $('button.new.question').click(function(event) {
    console.log('clicked new button');
    var questionnaire_id = $(event.target).data("questionnaireid");
    var url = "questionnaires/" + questionnaire_id +  "/questions"
    var qContent = $('input.new').val();
    jQuery.ajax({
      url: "/questionnaires/" + questionnaire_id +  "/questions",
      method: "POST",
      data: {content: qContent},
      dataType: "json",
      success: function(data){
        if (data.created) {
          $('input.new').val('');
          var newDiv = "<div data-question-id=" + data.questionId + "><p>"+ qContent + "</p><button class='edit question'>Edit Question</button><button class='delete question'>Remove</button></div>"
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

  $('button.edit.question').click(function(event) {
    editQuestion(event);
  });

  var editQuestion = function (event) {
    console.log('clicked edit button');
    var questionID = $(event.target).data("question-id");
    console.log(questionID);
    var $questionP = $('p[data-question-id=' + questionID + ']');
    var questionContent = $questionP.text();
    console.log(questionContent);
    var $editInput = $("<textarea></textarea>");
    $editInput.val(questionContent);
    $editInput.attr("data-question-id", questionID);
    $questionP.replaceWith($editInput);
    $updateButton = $("<button class='update question' data-question-id=" + questionID + ">Update Question</button>");
    $(event.target).replaceWith($updateButton);
    $updateButton.click(function(event) {
      submitUpdate(event);
    });
  };

  var submitUpdate = function(event) {
    console.log("clicked update button");
    var questionID = $(event.target).data("question-id");
    var questionnaireID = $(event.target).parent().parent().data("questionaire-id");
    console.log(questionID);
    var $questionInput = $('textarea[data-question-id=' + questionID + ']');
    var questionContent = $questionInput.val();
    console.log(questionContent);
    jQuery.ajax({
      url: "/questionnaires/" + questionnaireID +  "/questions/" + questionID,
      method: "PATCH",
      data: {content: questionContent},
      dataType: "json",
      success: function(data){
        if (data.updated) {
          var $questionP = $("<p>" + questionContent + "</p>");
          $questionP.attr("data-question-id", questionID);
          $questionInput.replaceWith($questionP);
          $editButton = $("<button class='edit question' data-question-id=" + questionID + ">Edit Question</button>");
          $(event.target).replaceWith($editButton);
          $editButton.click(function(event) {
            editQuestion(event);
          });
          console.log("Question successfully updated");
        } else {
          console.log("Not updated");
        }
      }, 
      error: function(error) {
        console.log(error);
      }
    });
  };

  $('button.delete.question').click(function(event) {
    console.log('clicked delete button');
    var $parentDiv = $(event.target).parent();
    var questionID = $parentDiv.data("question-id");
    var questionnaireID = $(event.target).parent().parent().data("questionaire-id");
    console.log(questionID);
    jQuery.ajax({
      url: "/questionnaires/" + questionnaireID +  "/questions/" + questionID,
      method: "DELETE",
      dataType: "json",
      success: function(data){
        if (data.deleted) {
          $parentDiv.remove();
          console.log("Question successfully deleted");
        } else {
          console.log("Not deleted");
        }
      }, 
      error: function(error) {
        console.log(error);
      }
    });    
  });
});