class CheckPermMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = ActionDispatch::Request.new(env)
    token = request.headers['Authorization']&.split('Bearer ')&.last


    if should_use_this?(request)
      if !token || !has_perm(token)
        return [401, { 'Content-Type' => 'application/json' }, [{ status: 'failed', message: 'Accès refusé' }.to_json]]
      end
    end

    @app.call(env)
  end

  def has_perm(token)
    decoded_token = TokenManager.decode(token)
    if decoded_token && (decoded_token['role'] == 'admin' || decoded_token['role'] == 'owner')
      true
    else
      false
    end
  end

  def should_use_this?(request)
    request.path =~ /admin/
  end
end
