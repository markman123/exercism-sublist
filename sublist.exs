defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b            -> :equal
      a == []           -> :sublist
      b == []           -> :superlist
      a_in_b?(a,b,true) -> :sublist
      a_in_b?(b,a,true) -> :superlist
      true              -> :unequal
    end
  end

  defp a_in_b?([],[], bool), do: bool
  defp a_in_b?(_,[],_), do: false
  defp a_in_b?([],_,bool), do: bool

  defp a_in_b?(a = [a_head|a_tail], b = [b_head|b_tail], _bool) do
    if a_head === b_head do
      a_in_b?(a_tail,b_tail,true)
    else
      a_in_b?(a,b_tail,false)
    end
  end
end
