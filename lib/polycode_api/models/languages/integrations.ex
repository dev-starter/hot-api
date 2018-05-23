defmodule HotApi.Models.Languages.Integrations do
  alias HotApi.Services.Languages
  require IEx
  @moduledoc ~S"""
  # Integrations Model

  Model for Integrations Resource
  """

  @doc ~S"""
  List all integrations recordeds

  ### Example
      iex> import HotApi.Models.Languages.Integrations
      iex> all()
      2
  """
  def all do
    Languages.fast_find("all", %{integrations: 1, language: 1})
  end

  @doc ~S"""
  Find the integrations by language name

  ### Example
      iex> import HotApi.Models.Languages.Integrations
      iex> find("java")
      2
  """
  def find(language) do
    List.first Languages.fast_find(language, %{integrations: 1, language: 1})
  end
end
