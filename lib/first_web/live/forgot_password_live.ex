defmodule FirstWeb.ForgotPasswordLive do
  use FirstWeb, :live_view

  def mount(_params, _session, socket), do: {:ok, socket}
   def handle_event("reset_password",%{"email" => email}, socket) do
     IO.puts("Reset password for: #{email}")
  {:noreply, push_navigate(socket, to: ~p"/verification")}
end
  def render(assigns) do
    ~H"""
    <div class="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-navy-400 to-blue-500">
      <div class="flex items-center gap-2 mb-6">
        <img src={"/images/delivery-man.png"} alt="FoodFast Logo" class="w-10 h-10 sm:w-12 sm:h-12" />
        <h1 class="text-3xl font-extrabold sm:text-4xl">Forgot Password</h1>
      </div>

      <form phx-submit="reset_password" class="bg-blue-900 bg-opacity-80 text-white rounded-xl shadow-lg w-full max-w-sm p-6 space-y-4">
        <div>
          <label class="block text-sm font-medium mb-1">Email</label>
          <input
            type="email"
            name="email"
            class="w-full px-3 py-2 rounded-lg bg-blue-800 border border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400 placeholder-blue-200"
            placeholder="Enter your email"
          />
        </div>

        <button type="submit" class="w-full px-4 py-2 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 transition">
          Send Code
        </button>

        <div class="flex justify-center text-sm mt-2">
          <.link navigate={~p"/login"} class="text-blue-200 hover:underline">Back to Login</.link>
        </div>
      </form>
    </div>
    """
  end

end
