defmodule Onwipca.UserView do
  use Onwipca.Web, :view

  def render("user.json", %{user: user}) do
    %{first_name: user.first_name,
      last_name: user.last_name,
      bio: Onwipca.User.bio_formatted(user.bio)}
  end
end
