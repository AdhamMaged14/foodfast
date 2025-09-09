defmodule FirstWeb.LandingLive do
  use FirstWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
