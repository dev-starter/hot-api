defmodule HotApi.Models.Languages do
  alias HotApi.Services.Languages
  require IEx

  def all do
    Languages.fast_find("all")
  end

  def find(language) do
    List.first Languages.fast_find(language)
  end
end
