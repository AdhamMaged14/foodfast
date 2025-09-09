defmodule FirstWeb.ForgotPasswordLiveTest do
  use FirstWeb.ConnCase

  import Phoenix.LiveViewTest
  import First.AccountsFixtures

  @create_attrs %{email: "some email"}
  @update_attrs %{email: "some updated email"}
  @invalid_attrs %{email: nil}
  defp create_forgot_password(_) do
    forgot_password = forgot_password_fixture()

    %{forgot_password: forgot_password}
  end

  describe "Index" do
    setup [:create_forgot_password]

    test "lists all forgot_passwords", %{conn: conn, forgot_password: forgot_password} do
      {:ok, _index_live, html} = live(conn, ~p"/forgot_passwords")

      assert html =~ "Listing Forgot passwords"
      assert html =~ forgot_password.email
    end

    test "saves new forgot_password", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/forgot_passwords")

      assert {:ok, form_live, _} =
               index_live
               |> element("a", "New Forgot password")
               |> render_click()
               |> follow_redirect(conn, ~p"/forgot_passwords/new")

      assert render(form_live) =~ "New Forgot password"

      assert form_live
             |> form("#forgot_password-form", forgot_password: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert {:ok, index_live, _html} =
               form_live
               |> form("#forgot_password-form", forgot_password: @create_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/forgot_passwords")

      html = render(index_live)
      assert html =~ "Forgot password created successfully"
      assert html =~ "some email"
    end

    test "updates forgot_password in listing", %{conn: conn, forgot_password: forgot_password} do
      {:ok, index_live, _html} = live(conn, ~p"/forgot_passwords")

      assert {:ok, form_live, _html} =
               index_live
               |> element("#forgot_passwords-#{forgot_password.id} a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/forgot_passwords/#{forgot_password}/edit")

      assert render(form_live) =~ "Edit Forgot password"

      assert form_live
             |> form("#forgot_password-form", forgot_password: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert {:ok, index_live, _html} =
               form_live
               |> form("#forgot_password-form", forgot_password: @update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/forgot_passwords")

      html = render(index_live)
      assert html =~ "Forgot password updated successfully"
      assert html =~ "some updated email"
    end

    test "deletes forgot_password in listing", %{conn: conn, forgot_password: forgot_password} do
      {:ok, index_live, _html} = live(conn, ~p"/forgot_passwords")

      assert index_live |> element("#forgot_passwords-#{forgot_password.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#forgot_passwords-#{forgot_password.id}")
    end
  end

  describe "Show" do
    setup [:create_forgot_password]

    test "displays forgot_password", %{conn: conn, forgot_password: forgot_password} do
      {:ok, _show_live, html} = live(conn, ~p"/forgot_passwords/#{forgot_password}")

      assert html =~ "Show Forgot password"
      assert html =~ forgot_password.email
    end

    test "updates forgot_password and returns to show", %{conn: conn, forgot_password: forgot_password} do
      {:ok, show_live, _html} = live(conn, ~p"/forgot_passwords/#{forgot_password}")

      assert {:ok, form_live, _} =
               show_live
               |> element("a", "Edit")
               |> render_click()
               |> follow_redirect(conn, ~p"/forgot_passwords/#{forgot_password}/edit?return_to=show")

      assert render(form_live) =~ "Edit Forgot password"

      assert form_live
             |> form("#forgot_password-form", forgot_password: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert {:ok, show_live, _html} =
               form_live
               |> form("#forgot_password-form", forgot_password: @update_attrs)
               |> render_submit()
               |> follow_redirect(conn, ~p"/forgot_passwords/#{forgot_password}")

      html = render(show_live)
      assert html =~ "Forgot password updated successfully"
      assert html =~ "some updated email"
    end
  end
end
