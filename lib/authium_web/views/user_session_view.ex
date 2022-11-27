defmodule AuthiumWeb.UserSessionView do
  use AuthiumWeb, :view

  def render("user.json", %{conn: conn}) do
    user = conn.assigns.current_user
    %{
      id: user.id,
      email: user.email
    }
  end
end
