defmodule ForumWeb.PageController do
  use ForumWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    users = [
      %{name: "Alice", age: 30},
      %{name: "Bob", age: 31},
      %{name: "Charlie", age: 32}
    ]
    render(conn, :users, users: users, layout: false)
  end
end
