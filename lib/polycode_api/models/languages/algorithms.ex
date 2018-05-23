defmodule HotApi.Models.Languages.Algorithms do
  alias HotApi.Services.Languages
  @moduledoc ~S"""
  # Algorithms Model

  Model for Algorithms Resource
  """

  @doc ~S"""
  List all algorithms recordeds

  ### Example
      iex> import HotApi.Models.Languages.Algorithms
      iex> all()
      2
  """
  def all do
    Languages.fast_find("all", %{algorithms: 1, language: 1})
  end

  @doc ~S"""
  Find the algorithm by language name

  ### Example
      iex> import HotApi.Models.Languages.Algorithms
      iex> find("java")
      2
  """
  def find(language) do
    List.first Languages.fast_find(language, %{algorithms: 1, language: 1})
  end
end
