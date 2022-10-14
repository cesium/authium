defmodule Authium.Mailer do
  @moduledoc """
  A mailer module providing functionality to deliver emails.
  """
  use Swoosh.Mailer, otp_app: :authium
end
