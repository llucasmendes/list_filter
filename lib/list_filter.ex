defmodule ListFilter do
  def call(list), do: filter(list)

  defp filter([]), do: 0

  defp filter(list) do
    list
    |> Enum.filter(&(!is_atom(&1)))
    |> IO.inspect()
    |> Enum.map(fn num ->
      case num do
        num when is_integer(num) -> Integer.to_string(num)
        num when is_float(num) -> Float.to_string(num)
        _ -> num
      end
    end)
    |> IO.inspect()
    |> Enum.flat_map(fn element ->
      case Integer.parse(element) do
        {int, _rest} -> [int]
        :error -> []
      end
    end)
    |> IO.inspect()
    |> Enum.map(fn element ->
      if rem(element, 2) != 0 do
        element
      end
    end)
    |> IO.inspect()
    |> Enum.filter(&(!is_nil(&1)))
    |> length()
  end
end
