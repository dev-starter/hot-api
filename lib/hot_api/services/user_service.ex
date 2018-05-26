defmodule HotApi.Services.UserService do
  alias HotApi.Repositories.UserRepository
  alias UserRepository.DocumentsRepository

  def get_all do
    UserRepository.all
  end

  def find(externalID) do
    UserRepository.find(externalID)
  end

  def find_documents(externalID) do
    DocumentsRepository.find(externalID)
  end
end
