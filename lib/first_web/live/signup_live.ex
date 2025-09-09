defmodule FirstWeb.SignupLive do
  use FirstWeb, :live_view

  def mount(_params, _session, socket), do: {:ok, socket}

  def render(assigns) do
    ~H"""
    <div class="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-navy-400 to-blue-500">
      <div class="flex items-center gap-2 mb-6">
        <img src={"/images/delivery-man.png"} alt="FoodFast Logo" class="w-10 h-10 sm:w-12 sm:h-12" />
        <h1 class="text-3xl font-extrabold sm:text-4xl">Sign Up for FoodFast</h1>
      </div>

      <form phx-submit="signup" class="bg-blue-900 bg-opacity-80 text-white rounded-xl shadow-lg w-full max-w-sm p-6 space-y-4">
        <div>
          <label class="block text-sm font-medium mb-1">Name</label>
          <input
            type="text"
            name="name"
            class="w-full px-3 py-2 rounded-lg bg-blue-800 border border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400 placeholder-blue-200"
            placeholder="Enter your name"
          />
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">Email</label>
          <input
            type="email"
            name="email"
            class="w-full px-3 py-2 rounded-lg bg-blue-800 border border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400 placeholder-blue-200"
            placeholder="Enter your email"
          />
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">Password</label>
          <input
            type="password"
            name="password"
            class="w-full px-3 py-2 rounded-lg bg-blue-800 border border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400 placeholder-blue-200"
            placeholder="Enter your password"
          />
        </div>
        <div>
          <label class="block text-sm font-medium mb-1">Confirm Password</label>
          <input
            type="password"
            name="confirm_password"
            class="w-full px-3 py-2 rounded-lg bg-blue-800 border border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400 placeholder-blue-200"
            placeholder="Confirm your password"
          />
        </div>

        <button type="submit" class="w-full px-4 py-2 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 transition">
          Sign Up
        </button>

        <div class="flex justify-center text-sm mt-2">
          <.link navigate={~p"/login"} class="text-blue-200 hover:underline">Already have an account? Login</.link>
        </div>
      </form>
    </div>
    """
  end
end
