class FormController < ApplicationController
  def main
    @questions = QUESTIONS
  end
end
