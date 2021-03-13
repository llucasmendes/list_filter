defmodule ListFilter do
  def call(list), do: filter(list)

  defp filter([]), do: 0

  defp filter(list) do
    list
    |> Enum.flat_map(fn element ->
      case Integer.parse(element) do
        {int, _rest} -> [int]
        :error -> []
      end
    end)
    |> Enum.map(fn element ->
      if rem(element, 2) != 0 do
        element
      end
    end)
    |> Enum.filter(&(!is_nil(&1)))
    |> length()
  end
end
