defmodule ForumWeb.PostJSON do
  alias Forum.Posts.Post

  @doc """
  Renders a single post.
  """
  # def show(%{post: post}) do
  #   # %{post: data(post)}
  #   %{data: data(post)}
  # end

  def show(%{post: post, success: success, message: message}) do
    %{
      success: success,
      message: message,
      data: if is_list(post) do
        for(p <- post, do: data(p))  # Untuk daftar post
      else
        data(post)               # Untuk satu post
      end
    }
  end

  def data(%Post{} = post) do
    %{
      id: post.id,
      body: post.body,
      title: post.title,
      user_id: post.user_id
    }
  end
end
