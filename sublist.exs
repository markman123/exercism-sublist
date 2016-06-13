defmodule Sublist do
  require IEx;

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a == b            -> :equal
      a == []           -> :sublist
      b == []           -> :superlist
      search(a,b) -> :sublist
      search(b,a) -> :superlist
      true              -> :unequal
    end
  end

  def test_search do
    search([3, 4, 5], [1, 2, 3, 4, 5])
  end

  @doc """
  Search that list a is in list b
  """
  def search(a,b) do
    do_search(a,b,a,length(a))
  end

  defp do_search([],_,_,_), do: false
  defp do_search(_,[],_,_), do: false
  defp do_search([a_head|a_tail],b = [b_head|b_tail],orig_a,slice_length) do

    if a_head === b_head
      and Enum.slice(b,0,slice_length) === orig_a
        do
          true
        else
          do_search(orig_a, b_tail, orig_a,slice_length)
        end
    end
end


