defmodule Tentacat.App.Installations do
  import Tentacat
  alias Tentacat.Client

  @doc """
  List installations for the authorized app

  ## Example

      Tentacat.App.Installations.list_mine client

  More info at: https://developer.github.com/v3/apps/#find-installations
  """
  @spec list_mine(Client.t) :: Tentacat.response
  def list_mine(client) do
    get "app/installations", client
  end

  @doc """
  List installations accessible with the authenticated app user

  ## Example

      Tentacat.App.Installations.list_for_user client

  More info at: https://developer.github.com/v3/apps/#list-installations-for-user
  """
  @spec list_for_user(Client.t) :: Tentacat.response
  def list_for_user(client) do
    get "user/installations", client
  end

  @doc """
  Get a specific installation

  ## Example

      Tentacat.App.Installations.find 12, client

  More info at: https://developer.github.com/v3/apps/#get-a-single-installation
  """
  @spec find(integer, Client.t) :: Tentacat.response
  def find(installation_id, client) do
    get "app/installations/#{installation_id}", client
  end

  @doc """
  Get an authorization token for an installation

  ## Example

      Tentacat.App.Installations.token 12, client

  More info at: https://developer.github.com/v3/apps/#create-a-new-installation-token
  """
  @spec token(integer, Client.t) :: Tentacat.response
  def token(installation_id, client) do
    post "app/installations/#{installation_id}/access_tokens", client
  end

  @doc """
  List repositories for the authenticated installation

  ## Example

      Tentacat.App.Installations.list_repositories client

  More info at: https://developer.github.com/v3/apps/installations/#list-repositories
  """
  @spec list_repositories(Client.t) :: Tentacat.response
  def list_repositories(client) do
    get "installation/repositories", client
  end

  @doc """
  List repositories in an installation that are accessible with to the authenticated app user

  ## Example

      Tentacat.App.Installations.list_repositories_for_user 154, client

  More info at: https://developer.github.com/v3/apps/#list-installations-for-user
  """
  @spec list_repositories_for_user(integer, Client.t) :: Tentacat.response
  def list_repositories_for_user(installation_id, client) do
    get "user/installations/#{installation_id}/repositories", client
  end

end
