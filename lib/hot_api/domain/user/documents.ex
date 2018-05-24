defmodule HotApi.Domain.User.Documents do
  alias HotApi.Repositories.UserRepository
  require IEx
  @moduledoc ~S"""
  # Algorithms Model

  Model for Algorithms Resource
  """

  @doc ~S"""
  List all algorithms recordeds

  ### Example
      iex> import HotApi.Domain.Languages.Algorithms
      iex> all()
      2
  """
  def all do
    UserRepository.fast_find("all", %{documents: 1, externalID: 1})
  end

  @doc ~S"""
  Find the algorithm by language name

  ### Example
      iex> import HotApi.Domain.Languages.Algorithms
      iex> find("java")
      2
  """
  def find(documents) do
    List.first UserRepository.fast_find(documents, %{documents: 1, externalID: 1})
  end
end
