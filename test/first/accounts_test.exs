defmodule First.AccountsTest do
  use First.DataCase

  alias First.Accounts

  describe "forgot_passwords" do
    alias First.Accounts.ForgotPassword

    import First.AccountsFixtures

    @invalid_attrs %{email: nil}

    test "list_forgot_passwords/0 returns all forgot_passwords" do
      forgot_password = forgot_password_fixture()
      assert Accounts.list_forgot_passwords() == [forgot_password]
    end

    test "get_forgot_password!/1 returns the forgot_password with given id" do
      forgot_password = forgot_password_fixture()
      assert Accounts.get_forgot_password!(forgot_password.id) == forgot_password
    end

    test "create_forgot_password/1 with valid data creates a forgot_password" do
      valid_attrs = %{email: "some email"}

      assert {:ok, %ForgotPassword{} = forgot_password} = Accounts.create_forgot_password(valid_attrs)
      assert forgot_password.email == "some email"
    end

    test "create_forgot_password/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_forgot_password(@invalid_attrs)
    end

    test "update_forgot_password/2 with valid data updates the forgot_password" do
      forgot_password = forgot_password_fixture()
      update_attrs = %{email: "some updated email"}

      assert {:ok, %ForgotPassword{} = forgot_password} = Accounts.update_forgot_password(forgot_password, update_attrs)
      assert forgot_password.email == "some updated email"
    end

    test "update_forgot_password/2 with invalid data returns error changeset" do
      forgot_password = forgot_password_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_forgot_password(forgot_password, @invalid_attrs)
      assert forgot_password == Accounts.get_forgot_password!(forgot_password.id)
    end

    test "delete_forgot_password/1 deletes the forgot_password" do
      forgot_password = forgot_password_fixture()
      assert {:ok, %ForgotPassword{}} = Accounts.delete_forgot_password(forgot_password)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_forgot_password!(forgot_password.id) end
    end

    test "change_forgot_password/1 returns a forgot_password changeset" do
      forgot_password = forgot_password_fixture()
      assert %Ecto.Changeset{} = Accounts.change_forgot_password(forgot_password)
    end
  end
end
