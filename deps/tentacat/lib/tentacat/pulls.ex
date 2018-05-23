defmodule Tentacat.Pulls do
  import Tentacat
  alias Tentacat.Client

  @doc """
  List pull requests

  ## Example

      Tentacat.Pulls.list "elixir-lang", "elixir"
      Tentacat.Pulls.list "elixir-lang", "elixir", client

  More info at: https://developer.github.com/v3/pulls/#list-pull-requests
  """
  @spec list(binary, binary, Client.t) :: Tentacat.response
  def list(owner, repo, client \\ %Client{}) do
    get "repos/#{owner}/#{repo}/pulls", client
  end

@doc """
  Filter pull requests

  ## Example

      Tentacat.Pulls.filter "elixir-lang", "elixir", %{state: "open"}
      Tentacat.Pulls.filter "elixir-lang", "elixir", %{state: "open"}, client

  More info at: https://developer.github.com/v3/pulls/#parameters
  """
  @spec filter(binary, binary, map, Client.t) :: Tentacat.response
  def filter(owner, repo, filters, client \\ %Client{}) do
    get "repos/#{owner}/#{repo}/pulls?#{URI.encode_query(filters)}", client
  end

  @doc """
  Get a single pull request

  ## Example

      Tentacat.Pulls.find "elixir-lang", "elixir", "2974"
      Tentacat.Pulls.find "elixir-lang", "elixir", "2974", client

  More info at: https://developer.github.com/v3/pulls/#get-a-single-pull-request
  """
  @spec find(binary, binary, binary | integer, Client.t) :: Tentacat.response
  def find(owner, repo, number, client \\ %Client{}) do
    get "repos/#{owner}/#{repo}/pulls/#{number}", client
  end

  @doc """
  Create a pull request

  Pull Request body example:

      %{
        "title" => "Amazing new feature",
        "body"  => "Please pull this in!",
        "head"  => "octocat:new-feature",
        "base"  => "master"
       }

  Alternative input (using an existing issue):

      %{
        "issue" => "5",
        "head"  => "octocat:new-feature",
        "base"  => "master"
       }

  ## Example

      Tentacat.Pulls.create "elixir-lang", "elixir", body, client

  More info at: https://developer.github.com/v3/pulls/#create-a-pull-request
  """
  @spec create(binary, binary, list | map, Client.t) :: Tentacat.response
  def create(owner, repo, body, client) do
    post "repos/#{owner}/#{repo}/pulls", client, body
  end

  @doc """
  Update a pull request

  Pull Request body example:

      %{
        "title" => "new title",
        "body"  => "updated body",
        "state" => "open"
       }

  ## Example

      Tentacat.Pulls.update "elixir-lang", "elixir", "2974", body, client

  More info at: https://developer.github.com/v3/pulls/#update-a-pull-request
  """
  @spec update(binary, binary, binary | integer, list | map, Client.t) :: Tentacat.response
  def update(owner, repo, number, body, client) do
    patch "repos/#{owner}/#{repo}/pulls/#{number}", client, body
  end

  @doc """
  Merge a pull request (Merge Button)

  Pull Request Merge body example:

      %{
        "commit_message" => "not the default commit_message",
        "sha"  => "8e50d79f2ba0d665b9966908cbf22c6f463228d6"
       }

  ## Example

      Tentacat.Pulls.merge "elixir-lang", "elixir", "4876", body, client

  More info at: https://developer.github.com/v3/pulls/#merge-a-pull-request-merge-button
  """
  @spec merge(binary, binary, binary | integer, list | map, Client.t) :: Tentacat.response
  def merge(owner, repo, number, body, client) do
    put "repos/#{owner}/#{repo}/pulls/#{number}/merge", client, body
  end

  @doc """
  Get if a pull request has been merged

  ## Example

      Tentacat.Pulls.has_been_merged "elixir-lang", "elixir", "4876", client

  More info at: https://developer.github.com/v3/pulls/#get-if-a-pull-request-has-been-merged
  """
  @spec has_been_merged(binary, binary, binary | integer, Client.t) :: Tentacat.response
  def has_been_merged(owner, repo, number, client) do
    get "repos/#{owner}/#{repo}/pulls/#{number}/merge", client
  end
end
