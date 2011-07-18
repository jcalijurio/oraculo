module AnswersHelper
  def actions_for_answer(question, answer)

    html = []
    if answer.owner == current_user
      html << link_to("Edit", { :controller => 'answers', :action => 'edit', :id => answer.id })
      html << link_to_destroy("Delete", { :controller => 'answers', :action => 'destroy', :id => answer.id })
    end

    if question.owner == current_user and question.best_answer == nil
      html << link_to("Best Answer", { :controller => 'answers', :action => 'bestanswer', :id => answer.id })
    end

    if html.size == 0
      return
    end

    content_tag :span, html.join(" | ").html_safe, class: "answerActions"
  end
end

