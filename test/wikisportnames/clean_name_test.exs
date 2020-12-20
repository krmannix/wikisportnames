defmodule CleanNameTest do
  use ExUnit.Case

  test "it removes trailing [A-Z]" do
    assert CleanName.clean("Ross Stripling [D]") == "Ross Stripling"
    assert CleanName.clean("DJ LeMahieu [H]") == "DJ LeMahieu"
    assert CleanName.clean("Mike Remlinger [b]") == "Mike Remlinger"
  end

  test "it returns nil for just numbers" do
    assert CleanName.clean("2015") == nil
  end

  test "it trims" do
    assert CleanName.clean("  Jason Heyward   ") == "Jason Heyward"
  end

  test "it removes #" do
    assert CleanName.clean("Jason Heyward #") == "Jason Heyward"
  end

  test "it removes *" do
    assert CleanName.clean("Cliff Lee *") == "Cliff Lee"
  end

  test "it does not alter accents" do
    assert CleanName.clean("Magglio Ordóñez") == "Magglio Ordóñez"
  end

  test "it removes single downcase letters at the end" do
    assert CleanName.clean("Corey Hart c") == "Corey Hart"
    assert CleanName.clean("Corey Hart cc") == "Corey Hart cc"
    assert CleanName.clean("Corey c Hart") == "Corey c Hart"
  end

  test "it replaces double quotes" do
    assert CleanName.clean("Frank \"Bruiser\" Kinard") == "Frank 'Bruiser' Kinard"
  end
end
