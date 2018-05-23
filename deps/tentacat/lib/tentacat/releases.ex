defmodule Tentacat.Releases do
  import Tentacat
  alias Tentacat.Client

  @doc """
  Get all releases from the given repository

  ## Example

      Tentacat.Releases.list("elixir-lang", "elixir", client)

  More info at: http:\\developer.github.com/v3/repos/releases/#list-releases-for-a-repository
  """
  @spec list(binary, binary, Client.t) :: Tentacat.response
  def list(owner, repo, client \\ %Client{}) do
    get "repos/#{owner}/#{repo}/releases", client
  end

  @doc """
  Get a single release

  ## Example

      Tentacat.Releases.find(9949, "elixir-lang", "elixir", client)

  More info at: http:\\developer.github.com/v3/repos/releases/#get-a-single-release
  """
  @spec find(any, binary, binary, Client.t) :: Tentacat.response
  def find(id, owner, repo, client \\ %Client{}) do
    get "repos/#{owner}/#{repo}/releases/#{id}", client
  end

  @doc """
  Get the latest release

  ## Example

      Tentacat.Releases.latest("elixir-lang", "elixir", client)

  More info at: http:\\developer.github.com/v3/repos/releases/#get-the-latest-release

  """
  @spec latest(binary, binary, Client.t) :: Tentacat.response
  def latest(owner, repo, client \\ %Client{}) do
    get "repos/#{owner}/#{repo}/releases/latest", client
  end

  @doc """
  Create a new release from the given tag

  ## Example

      Tentacat.Releases.create("v0.11.0", elixir-lang", "elixir", client)

  More info at: http:\\developer.github.com/v3/repos/releases/#create-a-release
  """
  @spec create(binary, binary, binary, Client.t, list) :: Tentacat.response
  def create(tag_name, owner, repo, client \\ %Client{}, options \\ []) when is_binary(tag_name) do
    body = Keyword.merge(options, tag_name: tag_name)
    post "repos/#{owner}/#{repo}/releases", client, body
  end

  @doc """
  Edit an existing release

  ## Options

  * `tag_name` - string
  * `target_commitish` - string
  * `name` - string
  * `body` - string
  * `draft` - boolean
  * `prerelease` - boolean

  ## Example

      Tentacat.Releases.edit(95071, "elixir-lang", "elixir", client)

  More info at: http:\\developer.github.com/v3/repos/releases/#edit-a-release
  """
  @spec edit(integer, binary, binary, Client.t, list) :: Tentacat.response
  def edit(id, owner, repo, client \\ %Client{}, options \\ []) when is_integer(id) do
    patch "repos/#{owner}/#{repo}/releases/#{id}", client, options
  end

  @doc """
  Delete a release

  ## Example

      Tentacat.Releases.delete(95071, "elixir-lang", "elixir", client)

  More info at: http:\\developer.github.com/v3/repos/releases/#delete-a-release
  """
  @spec delete(integer, binary, binary, Client.t) :: Tentacat.response
  def delete(id, owner, repo, client \\ %Client{}) when is_integer(id) do
    delete "repos/#{owner}/#{repo}/releases/#{id}", client
  end
end
