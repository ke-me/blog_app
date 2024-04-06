module SessionsHelper
    # log_inというヘルパーメソッドを定義
    # 渡されたユーザーでログインする
    def log_in(user)
        session[:user_id] = user.id
    end

    # find_byでユーザーを呼び出す（データベースから探す？）
    # @current_userはインスタンス変数。一度呼び出したら、再度呼び出さないでいいように@current_userに代入している
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    # current_userがnillでない。つまり、ログイン中かどうかを定義するメソッド
    def logged_in?
        !current_user.nil?
    end
end
