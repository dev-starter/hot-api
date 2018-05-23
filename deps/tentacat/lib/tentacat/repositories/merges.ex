defmodule Tentacat.Repositories.Merges do
  import Tentacat
  alias Tentacat.Client

  @doc """
  Merge a branch into another

  You can use both branch names and/or a commit SHA1.
  When the commit message is empty, Github will apply the default commit message.
  ## Example

      Tentacat.Repositories.Merges.merge "elixir-lang", "elixir", "master", "123-another-feature", "", client
      Tentacat.Repositories.Merges.merge "elixir-lang", "elixir", "master", "123-another-feature", "not the default commit_message", client
      Tentacat.Repositories.Merges.merge "elixir-lang", "elixir", "8e50d79f2ba0d665b9966908cbf22c6f463228d6", "bafdae8b93e74738c12515c14c7cf9acc652650a", "", client

  More info at: https://developer.github.com/v3/repos/merging/#perform-a-merge
  """
  @spec merge(binary, binary, binary, binary, binary, Client.t) :: Tentacat.response
  def merge(owner, repo, base, head, commit_message, client \\ %Client{}) do
    body = %{
      base: base,
      head: head,
      commit_message: commit_message
    }
    post "repos/#{owner}/#{repo}/merges", client, body
  end

end
