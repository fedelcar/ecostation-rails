RailsAdmin.config do |config|
  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    # show_in_app do
    #   except ['Company', 'Prize']
    # end
  end
end
