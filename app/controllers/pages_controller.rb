class PagesController < ApplicationController

  skip_authorization_check

  def home
    @current_nav_identifier = :home

    users = Usertable.where(email: current_user.email)

    if users.length() == 0 then
      Usertable.create(fname: current_user.givenname, sname: current_user.sn, department: "COM", email: current_user.email, title: "Mr", profilepic: "e")
    end

  end

end
