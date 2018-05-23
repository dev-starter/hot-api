defmodule ExCoveralls.Cover do
  @moduledoc """
  Wrapper class for Erlang's cover tool.
  """

  @doc """
  Compile the beam files for coverage analysis.
  """
  def compile(compile_path) do
    :cover.stop
    :cover.start
    :cover.compile_beam_directory(compile_path |> String.to_char_list)
  end

  @doc """
  Returns the relative file path of the specified module.
  """
  def module_path(module) do
    module.module_info(:compile)[:source]
    |> List.to_string
    |> Path.relative_to(ExCoveralls.PathReader.base_path)
  end

  @doc "Wrapper for :cover.modules"
  def modules do
    :cover.modules |> Enum.filter(&has_compile_info?/1)
  end

  defp has_compile_info?(module) do
    try do
      module.module_info(:compile) != nil
    rescue
      _e in UndefinedFunctionError ->
        IO.puts :stderr, "[warning] skipping the module '#{module}' because source information for the module is not available."
        false
    end
  end

  @doc "Wrapper for :cover.analyse"
  def analyze(module) do
    :cover.analyse(module, :calls, :line)
  end
end
