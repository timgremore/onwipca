defmodule Onwipca.Factory do
  use ExMachina.Ecto, repo: Onwipca.Repo

  def user_factory do
    %Onwipca.User{
      username: sequence(:username, &"user-#{&1}"),
      first_name: "I",
      last_name: "Am",
      email: sequence(:email, &"email-#{&1}@am.com"),
      password: "secret",
    }
  end

  def church_factory do
    %Onwipca.Church{
      name: "Christ Covenant Church",
      street: "3630 Co Rd B",
      city: "La Crosse",
      state: "WI",
      zipcode: "54601",
      url: "http://example.com",
      particularized_at: %Ecto.DateTime{year: 1992, month: 1, day: 1, hour: 12, min: 0, sec: 0},
      founder: build(:user),
    }
  end
end
