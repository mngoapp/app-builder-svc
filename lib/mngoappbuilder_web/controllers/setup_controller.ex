# defmodule MngoAppBuilderWeb.SetupController do
#   use MngoAppBuilderWeb, :controller
#   action_fallback MngoAppBuilderWeb.FallbackController
#   def setup(conn,
#   %{
#     "slack_apikey" => slack_apikey,
#     "sendgrid_apikey" => sendgrid_apikey,
#     "email_notifications_enabled" => email_notifications_enabled,
#     "slack_notifications_enabled" => slack_notifications_enabled,
#     "notifications_enabled" => notifications_enabled,
#     "email_from_address" => email_from_address,
#     "email_to_address" => email_to_address,
#     "scheduler_interval" => scheduler_interval
#   } = params) do
#     GenServer.cast(:setting_gen_server,{:setup,
#     scheduler_interval,
#     email_notifications_enabled,
#     slack_notifications_enabled,
#     notifications_enabled,
#     slack_apikey,
#     sendgrid_apikey,
#     email_to_address,
#     email_from_address})
#     json conn |> put_status(:created), params
#   end
# end
