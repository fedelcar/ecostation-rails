RailsAdmin.config do |config|
  config.authorize_with :pundit
  config.current_user_method(&:current_user)
  config.label_methods << :legal_name
  config.label_methods << :description

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    # history_index
    bulk_delete

    # member actions
    show
    edit
    delete
    # history_show
    # show_in_app do
    #   except ['Company', 'Prize']
    # end
  end

  config.model 'Transaction' do
    list do
      scopes [:own, nil]
    end
  end

  config.model 'Prize' do
    list do
      scopes [:own, nil]
    end
  end

  config.model 'User' do
    list do
      field :first_name
      field :last_name
      field :email
      field :dni
      field :bottles
      field :company
      scopes [:own, nil]
    end

    edit do
      include_all_fields # all other default fields will be added after, conveniently
      exclude_fields :reset_password_sent_at, :reset_password_token, :remember_created_at, :transactions, :trades, :title
      field :site_admin do
        visible do
          bindings[:view]._current_user.site_admin?
        end
      end
      field :password_confirmation do
        label "Repetir contraseña"
      end
    end
  end
end
