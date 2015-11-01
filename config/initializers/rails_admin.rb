RailsAdmin.config do |config|
  config.authorize_with :pundit
  config.current_user_method(&:current_user)
  config.label_methods << :legal_name
  config.label_methods << :description
  config.label_methods << :email

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
end
