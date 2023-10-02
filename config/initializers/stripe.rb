Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)
Stripe.api_version = "2023-08-16;embedded_checkout_beta=v2"
