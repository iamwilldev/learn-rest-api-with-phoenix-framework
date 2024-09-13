# Forum

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Phoenix Shortcut

- Creates a new Phoenix project `mix phx.new nameProject --no-ecto`
- Create the storage for the given repository `mix ecto.create`
- Generates a migration `mix ecto.gen.migration add_posts_table`
- Run the database migrations `mix ecto.migrate`
- Start the Phoenix server `mix phx.server` or `iex -S mix phx.server`
- Generates controller, JSON view, and context for a JSON resource `mix phx.gen.json Accounts User users name:string age:integer`
- Check the routes `mix phx.routes`

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
