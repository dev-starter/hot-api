defmodule HotApi.API.User do
  use Maru.Router
  # alias HotApi.Domain.User
  alias HotApi.Repositories.UserRepository
  alias UserRepository.DocumentsRepository
  require Logger
  require IEx

  helpers HotApi.Helpers.User

  namespace :users do
    desc "Retrieve list of the Languages"
    get do
      conn |> json(UserRepository.all)
    end

    route_param :externalID, type: String do
      desc "Retrieve a Languages collection data"
      get do
        conn |> json(UserRepository.find(params[:externalID]))
      end

      desc "Retrieve list of the Algorithms by language"
      get :documents do
        conn |> json(DocumentsRepository.find(params[:externalID]))
      end
    end
  end
end
