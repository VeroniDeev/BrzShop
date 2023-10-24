class TokenManager
  class << self
    def encode(playload, expiration = 24.hours.from_now)
      playload[:exp] = expiration.to_i
      JWT.encode(playload, Rails.application.secrets.secret_key_base)
    end
    def decode(token)
      decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)
      decoded[0]
    rescue JWT::DecodeError
      nil
    end
  end
end
