defmodule HotApi.Domain.User do
  alias HotApi.Repositories.UserRepository

  def all do
    UserRepository.fast_find("all")
  end

  def find(user) do
    List.first UserRepository.fast_find(user)
  end
end
