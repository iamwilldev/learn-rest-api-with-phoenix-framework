defmodule ForumWeb.PostController do
  use ForumWeb, :controller

  alias Forum.Posts
  alias Forum.Posts.Post

  action_fallback ForumWeb.FallbackController

  def index(conn, _params) do
    posts = Posts.list_posts()
    render(conn, :show, post: posts, success: true, message: "Post successfully fetched")
  end

  @spec create(any(), map()) :: any()
  def create(conn, %{"post" => post_params}) do
    try do
      case Posts.create_post(post_params) do
        {:ok, %Post{} = post} ->
          conn
          |> put_status(:created)
          |> put_resp_header("location", ~p"/api/posts/#{post}")
          |> render(:show, post: post, success: true, message: "Post created successfully")

        {:error, changeset} ->
          conn
          |> put_status(:unprocessable_entity)
          |> render(:show, post: [], success: false, message: "Failed to create post", errors: changeset.errors)
      end
    catch
      :exit, reason ->
        conn
        |> put_status(:internal_server_error)
        |> json(%{success: false, message: "An unexpected error occurred", error: inspect(reason)})
    end
  end

  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    render(conn, :show, post: post, success: true, message: "Post successfully fetched")
  end

  def update(conn, %{"id" => id, "post" => post_params}) do
    post = Posts.get_post!(id)

    with {:ok, %Post{} = post} <- Posts.update_post(post, post_params) do
      render(conn, :show, post: post, success: true, message: "Post updated successfully")
    end
  end

  def delete(conn, %{"id" => id}) do
    post = Posts.get_post!(id)

    with {:ok, %Post{}} <- Posts.delete_post(post) do
      render(conn, :show, post: [], success: true, message: "Post successfully deleted")
    end
  end
end
