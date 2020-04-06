# frozen_string_literal: true

module Auth
  class InfoController < ApplicationController
    # simple notification for in-browser email confirmation
    def confirmation_success
      render html: 'Email has been successfully confirmed'
    end
  end
end
