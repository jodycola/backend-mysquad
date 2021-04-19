class UsersController < ApplicationController
    before_action :authenticate, only: [:auth]

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def auth
        render json: @current_user
    end

    def name_change
        user = User.find(params[:id])
        if user && user.authenticate(params[:verify])
            edit = User.update(params[:id], 
                :name => params[:name],
                :email => params[:email],
                :password => params[:verify])
            render json: edit
        else
            render json: { errors: ["Incorrect password"] }, status: :unauthorized
        end
    end

    def email_change
        user = User.find(params[:id])
        if user && user.authenticate(params[:verify])
            edit = User.update(params[:id], 
                :name => params[:name],
                :email => params[:email],
                :password => params[:verify])
            render json: edit
        else
            render json: { errors: ["Incorrect password"] }, status: :unauthorized
        end
    end

    def password_change
        if params[:password] == params[:confirm]
            user = User.find(params[:id])
            if user && user.authenticate(params[:password])
                edit = User.update(params[:id],
                    :name => params[:name],
                    :email => params[:email],
                    :password => params[:confirm])
                render json: edit
            else
                render json: { errors: ["Incorrect password"] }, status: :unauthorized
            end
        else
            render json: { errors: ["Incorrect password"] }, status: :unauthorized
        end
    end

    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          token = JWT.encode({ user_id: user.id }, '$3cr3t', 'HS256')
          render json: { user: UserSerializer.new(user), token: token }
        else
          render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end
    end

    def signup
        user = User.create(name: params[:name], email: params[:email], password: params[:password])
        Team.create(team_name: "New Team", salary: 100000, user_id: user.id)
        if user.valid?
            user && user.authenticate(params[:password])
            token = JWT.encode({ user_id: user.id }, '$3cr3t', 'HS256')
            render json: { user: UserSerializer.new(user), token: token }
        else
            render json: { errors: users.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def delete
        user = User.find(params[:id])
        if params[:password] == params[:verify]
            if user && user.authenticate(params[:password])
                remove = User.destroy(params[:id])
                render json: remove
            else
                render json: { errors: ["Incorrect password"] }, status: :unauthorized
            end
        else
            render json: { errors: ["Incorrect password"] }, status: :unauthorized
        end
    end

end
