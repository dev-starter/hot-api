defmodule HotApi.Domain.UserRepository do
  alias HotApi.Repositories.Repository

  def all do
    Repository.fast_find("all")
  end

  def find(user) do
    List.first Repository.fast_find(user)
  end
end
