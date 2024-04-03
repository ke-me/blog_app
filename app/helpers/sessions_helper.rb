module SessionsHelper
    # log_inというヘルパーメソッドを定義
    def log_in(user)
        # 渡されたユーザーでログインする
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
end
