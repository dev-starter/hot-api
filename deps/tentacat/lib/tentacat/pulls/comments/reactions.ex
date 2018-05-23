defmodule Tentacat.Pulls.Comments.Reactions do
  import Tentacat

  alias Tentacat.Client

  @doc """
  List the reactions on a issue

  ## Example

  Tentacat.Pulls.Comments.Reactions.list "elixir-lang" , "elixir", "3"

  More info at: https://developer.github.com/v3/reactions/#list-reactions-for-a-pull-request-review-comment
  """

  @spec list(binary, binary, binary | integer, Client.t) :: Tentacat.response
  def list(owner, repo, comment_id, client \\ %Client{}) do
    get "repos/#{owner}/#{repo}/pulls/comments/#{comment_id}/reactions", client
  end

  @doc """
  Create a reaction on an issue

  Reaction Request body example:
      %{ content: "heart" }


  ### Example

  Tentacat.Pulls.Comments.Reactions.create "elixir-lang", "elixir", "3"

  More info at: https://developer.github.com/v3/reactions/#create-reaction-for-a-pull-request-review-comment
  """
  @spec create(binary, binary, binary | integer, Keyword.t | map, Client.t) :: Tentacat.response
  def create(owner, repo, comment_id, body, client \\ %Client{}) do
    post "repos/#{owner}/#{repo}/pulls/comments/#{comment_id}/reactions", client, body
  end
end
