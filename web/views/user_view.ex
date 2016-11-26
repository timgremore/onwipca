defmodule Onwipca.UserView do
  use Onwipca.Web, :view

  def render("user.json", %{user: user}) do
    %{id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      username: user.username,
      email: user.email}
  end

  def render("user.json", %{user: nil}) do
    %{}
  end
end
