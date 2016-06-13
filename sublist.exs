defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b                  -> :equal
      a == []                 -> :sublist
      b == []                 -> :superlist
      a_in_b?(a,b,a,[],:true) -> :sublist
      a_in_b?(b,a,b,[]f,:true) -> :superlist
      true                    -> :unequal
    end
  end

  defp a_in_b?([],[],_,_,bool), do: bool
  defp a_in_b?(_,[],_,_,_), do: false
  defp a_in_b?([],_,_,_,bool), do: bool

  defp a_in_b?([a_head|a_tail], [b_head|b_tail],orig_a,match_b, _bool) do
    if a_head === b_head do
      if match_b == [] do
        match_b = b_tail
      end
      a_in_b?(a_tail,b_tail,orig_a,match_b,true)
    else
      a_in_b?(orig_a,match_b,orig_a,[],false)
    end
  end
end
