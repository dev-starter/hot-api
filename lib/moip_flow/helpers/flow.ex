defmodule MoipFlow.Helpers.Flow do
  use Maru.Helper

  params :format do
    optional :format, type: :atom, values: [:html, :markdown], default: :markdown
  end
end
