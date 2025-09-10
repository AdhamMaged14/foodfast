defmodule FirstWeb.VerificationLive do
  use FirstWeb, :live_view

  def mount(_params, _session, socket), do: {:ok, socket}

  def render(assigns) do
    ~H"""
    <div class="min-h-screen flex flex-col items-center justify-center bg-gradient-to-b from-navy-400 to-blue-500">
      <!-- Back button -->
      <div class="absolute top-6 left-6">
        <.link navigate={~p"/forgot-password"} class="bg-white rounded-full p-2 shadow-lg">
          ←
        </.link>
      </div>

      <!-- Title -->
      <div class="text-center mb-8">
        <h1 class="text-3xl font-extrabold text-white">Verification</h1>
        <p class="text-blue-200 mt-2">
          We have sent a code to your email <br />
          <span class="font-semibold">example@gmail.com</span>
        </p>
      </div>

      <!-- Code input -->
      <form phx-submit="verify_code" class="bg-blue-900 bg-opacity-80 text-white rounded-xl shadow-lg w-full max-w-sm p-6 space-y-6">
        <div class="flex justify-center gap-3">
          <input maxlength="1" class="w-12 h-12 text-center text-lg font-bold rounded-lg bg-blue-800 border border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400" />
          <input maxlength="1" class="w-12 h-12 text-center text-lg font-bold rounded-lg bg-blue-800 border border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400" />
          <input maxlength="1" class="w-12 h-12 text-center text-lg font-bold rounded-lg bg-blue-800 border border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400" />
          <input maxlength="1" class="w-12 h-12 text-center text-lg font-bold rounded-lg bg-blue-800 border border-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400" />
        </div>

        <!-- Resend -->
        <div class="text-center text-sm text-blue-300">
          Resend in <span class="font-semibold">50 sec</span>
        </div>

        <!-- Verify Button -->
        <button type="submit" class="w-full px-4 py-2 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 transition">
          VERIFY
        </button>
      </form>
    </div>
    """
  end
end
